import 'dart:collection';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/data/models/user_rank.dart';
import 'package:quiz/src/screen/user/user_event.dart';
import 'package:quiz/src/screen/user/user_state.dart';
import 'package:quiz/src/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  var db = AppDatabase.getInstance().modesDao;
  final firebaseDb = FirebaseDatabase.instance.reference();

  UserBloc() : super(UserInitialState());

  String id;

  List<TitleData> titles;

  FirebaseStorage storage;

  List<UserData> user;

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    user = await db.getUser;
    storage = FirebaseStorage(storageBucket: 'gs://quizz-2020.appspot.com');
    if (event is RegisterUserEvent) {
      int result;
      await db
          .insertUser(userModel: event.user)
          .then((value) => result = value);
      if (result == null) {
        yield RegisterUserFail();
      } else {
        yield RegisterUserSuccess();
      }
    } else if (event is UserLoadInformationEvent) {
      var user = await db.getUser;
      yield UserLoadedInformationState(user: user[0]);
    } else if (event is UserLoadedPointState) {
      var point = await db.getPoints;
      yield UserLoadedPointState(point: point[0]);
    } else if (event is UserUpdatePointEvent) {
      await db.updateUserPoint(
          event.id, event.ePoint, event.mPoint, event.hPoint);
      var user = await db.getUser;
      yield UserLoadedInformationState(user: user[0]);
    } else if (event is UserGetTitlesEvent) {
      titles = await db.getTitles;
      yield UserGetTitlesState(titles: titles);
    } else if (event is UserUpdateMedalEvent) {
      updateData(
          event.mobile,
          event.rankPoint,
          event.goldPoint,
          event.silverPoint,
          event.bronzePoint,
          event.ePoint,
          event.mPoint,
          event.hPoint);
      id = event.id.toString();
      await db.updateUserMedal(event.id, event.bronzePoint, event.silverPoint,
          event.goldPoint, event.rankPoint);
    } else if (event is UserUpdateStatusTitleEvent) {
      if (event.currentTitleId != -1) {
        await db.updateTitleStatus(event.currentTitleId, TITLE_ACTIVE);
      }
      firebaseDb.child(FIREBASE_USERS_TABLE).child(event.mobile).update({
        FIREBASE_USER_CURRENT_TITLE: event.title,
        FIREBASE_USER_CURRENT_TITLE_ID: event.newTitleId
      });
      await db.updateTitleStatus(event.newTitleId, event.status);
      yield UserUpdateStatusTitleState();
    } else if (event is UserCheckTitleEvent) {
      titles = await db.getTitles;
      var item =
          getTitle(event.goldPoint, event.silverPoint, event.bronzePoint);
      if (item != null) {
        var user = await db.getUser;
        firebaseDb
            .child(FIREBASE_USERS_TABLE)
            .child(user[0].mobile)
            .child(FIREBASE_USER_TITLES)
            .update({item.id.toString(): item.id});
        await db.updateTitleStatus(item.id, TITLE_ACTIVE);
        yield UserCheckTitleState(item);
      }
    } else if (event is GetAllUserEvent) {
      DataSnapshot data = await firebaseDb
          .child(FIREBASE_USERS_TABLE)
          .orderByChild(FIREBASE_USER_RANK_POINT)
          .once();
      var list = getUserRanks(data);
      list.sort((a, b) {
        return int.parse(b.rank).compareTo(int.parse(a.rank));
      });
      var index = 0;
      for (int i = 0; i < list.length; i++) {
        if (list[i].mobile == user[0].mobile) ;
        index = i + 1;
        break;
      }
      await firebaseDb
          .child(FIREBASE_USERS_TABLE)
          .child(user[0].mobile)
          .update({FIREBASE_USER_RANK: index});
      await db.updateRank(user[0].id, index);
      yield GetAllUserState(list);
    } else if (event is UserUpdateCoverImageEvent) {
      var url = await _uploadFile(event.file);
      if (url != null) {
        await db.updateCoverImage(user[0].id, url);
        firebaseDb
            .child(FIREBASE_USERS_TABLE)
            .child(user[0].mobile)
            .update({FIREBASE_USER_IMAGE_COVER: url});
        var newUser = await db.getUser;
        yield UserLoadedInformationState(user: newUser[0]);
      }
    } else if (event is UserSignOutEvent) {
      await signOut();
      yield UserSignOutState();
    }
  }

  List<UserRank> getUserRanks(DataSnapshot dataSnapshot) {
    List<UserRank> list = List();
    LinkedHashMap<dynamic, dynamic> values = dataSnapshot.value;
    int i = 1;
    values.forEach((key, value) {
      list.add(UserRank(
          mobile: value[FIREBASE_USER_MOBILE],
          name: value[FIREBASE_USER_NAME],
          title: value[FIREBASE_USER_CURRENT_TITLE] == null
              ? "N/A"
              : value[FIREBASE_USER_CURRENT_TITLE],
          rank: value[FIREBASE_USER_RANK_POINT].toString(),
          image: value[FIREBASE_USER_IMAGE]));
      i = i++;
    });
    return list;
  }

  Future<void> signOut() async {
    await db.deleteUser();
    await db.deleteItems();
    await db.deleteTitles();
    var shared = await SharedPreferences.getInstance();
    shared.setBool(IS_REGISTER, false);
    shared.setBool(IS_INIT_DATA, false);
  }

  TitleData getTitle(int goldPoint, int silverPoint, int bronzePoint) {
    for (int i = 0; i < titles.length; i++) {
      TitleData item = titles[i];
      if (item.status == TITLE_ACTIVE || item.status == TITLE_IN_USE) continue;

      if (goldPoint >= item.hPoint &&
          silverPoint >= item.hPoint &&
          bronzePoint >= item.ePoint) {
        return item;
      }
    }
    return null;
  }

  void updateData(String mobile, int point, int goldPoint, int silverPoint,
      int bronzePoint, int ePoint, int mPoint, int hPoint) {
    firebaseDb.child(FIREBASE_USERS_TABLE).child(mobile).update({
      FIREBASE_USER_RANK_POINT: point,
      FIREBASE_USER_E_POINT: ePoint,
      FIREBASE_USER_SILVER_POINT: silverPoint,
      FIREBASE_USER_H_POINT: hPoint,
      FIREBASE_USER_M_POINT: mPoint,
      FIREBASE_USER_GOLD_POINT: goldPoint,
      FIREBASE_USER_BRONZE_POINT: bronzePoint
    });
  }

  Future<String> _uploadFile(File file) async {
    final StorageReference ref =
        storage.ref().child('imagesCover').child('image${user[0].id}.png');
    final StorageUploadTask uploadTask = ref.putFile(
      file,
      StorageMetadata(
        contentLanguage: 'en',
        customMetadata: <String, String>{'activity': 'quizz'},
      ),
    );
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    final String url = (await taskSnapshot.ref.getDownloadURL());
    return url;
  }
}
