import 'dart:collection';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/data/models/user.dart';
import 'package:quiz/src/data/models/user_rank.dart';
import 'package:quiz/src/screen/intro/intro_event.dart';
import 'package:quiz/src/utils/Constants.dart';

import 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  var db = AppDatabase.getInstance().modesDao;
  DatabaseReference firebaseDb = FirebaseDatabase.instance.reference();
  String phoneNumber;
  FirebaseApp app;
  FirebaseStorage storage;

  IntroBloc() : super(IntroInitState());

  @override
  Stream<IntroState> mapEventToState(IntroEvent event) async* {
    storage = FirebaseStorage(storageBucket: 'gs://quizz-2020.appspot.com');
    if (event is ValidatePhoneNumberEvent) {
      phoneNumber = event.phoneNumber;
      DataSnapshot value = await firebaseDb
          .child(FIREBASE_USERS_TABLE)
          .child(event.phoneNumber)
          .once();
      if (value.value == null)
        yield PhoneNumberIsValidState();
      else
        yield PhoneNumberIsExistsState();
    } else if (event is RegisterUserEvent) {
      yield RegisteringUserState();
      int result;
      String url = await _uploadFile(event.user, event.file);
      if (url != null) {
        event.user.image = url;
        createUser(event.user, url, event.phoneNumber);
        DataSnapshot data = await firebaseDb
            .child(FIREBASE_USERS_TABLE)
            .orderByChild(FIREBASE_USER_RANK_POINT)
            .once();
        var list = getUserRanks(data);
        list.sort((a, b) {
          return int.parse(b.rank).compareTo(int.parse(a.rank));
        });
        await firebaseDb
            .child(FIREBASE_USERS_TABLE)
            .child(event.phoneNumber)
            .update({FIREBASE_USER_RANK: list.length});
        await db
            .insertUser(userModel: event.user)
            .then((value) => result = value);
        await db.updateRank(event.user.id, list.length);
        if (result == null) {
          yield RegisterUserFail();
        } else {
          yield RegisterUserSuccess();
        }
      }
    } else if (event is LoginPhoneNumberEvent) {
      yield ProcessingState();
      DataSnapshot value = await firebaseDb
          .child(FIREBASE_USERS_TABLE)
          .child(event.phoneNumber)
          .once();
      if (value.value == null) {
        yield PhoneNumberIsNotExistsSate();
      } else {
        syncItems(value.value[FIREBASE_USER_ITEMS]);
        UserModel userModel = await getUserInfo(value);
        await db.insertUser(userModel: userModel);
        yield LoginSuccessState();
      }
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

  Future<UserModel> getUserInfo(DataSnapshot dataSnapshot) async {
    var value = dataSnapshot.value;
    UserModel userModel = UserModel(
        id: DateTime.now().millisecondsSinceEpoch,
        name: value[FIREBASE_USER_NAME],
        date: DateTime.now(),
        ePoint: value[FIREBASE_USER_E_POINT],
        mPoint: value[FIREBASE_USER_M_POINT],
        hPoint: value[FIREBASE_USER_H_POINT],
        bronzePoint: value[FIREBASE_USER_BRONZE_POINT],
        silverPoint: value[FIREBASE_USER_SILVER_POINT],
        goldPoint: value[FIREBASE_USER_GOLD_POINT],
        image: value[FIREBASE_USER_IMAGE],
        mobile: value[FIREBASE_USER_MOBILE],
        rankPoint: value[FIREBASE_USER_RANK_POINT],
        imageCover: value[FIREBASE_USER_IMAGE_COVER]);
    var titles = value[FIREBASE_USER_TITLES];
    var currentTitleId = value[FIREBASE_USER_CURRENT_TITLE_ID];
    await syncTitle(titles, currentTitleId);
    return userModel;
  }

  Future<void> syncTitle(List<dynamic> titles, int currentTitleId) async {
    titles.forEach((id) async {
      if (id != null) await db.updateTitleStatus(id, TITLE_ACTIVE);
    });
    if (currentTitleId != null) {
      await db.updateTitleStatus(currentTitleId, TITLE_IN_USE);
    }
  }

  Future<void> syncItems(List<dynamic> data) async {
    for (int i = 0; i < data.length; i++) {
      if (data[i] != null) {
        await db.updateItem(i, data[i]);
      }
    }
  }

  void createUser(UserModel user, String url, String phoneNumber) {
    firebaseDb.child(FIREBASE_USERS_TABLE).child(phoneNumber).set({
      FIREBASE_USER_NAME: user.name,
      FIREBASE_USER_IMAGE: url,
      FIREBASE_USER_RANK_POINT: user.rankPoint,
      FIREBASE_USER_RANK: "N/A",
      FIREBASE_USER_BRONZE_POINT: user.bronzePoint,
      FIREBASE_USER_GOLD_POINT: user.goldPoint,
      FIREBASE_USER_SILVER_POINT: user.silverPoint,
      FIREBASE_USER_E_POINT: user.ePoint,
      FIREBASE_USER_H_POINT: user.hPoint,
      FIREBASE_USER_M_POINT: user.mPoint,
      FIREBASE_USER_MOBILE: phoneNumber,
      FIREBASE_USER_CURRENT_TITLE: "N/A",
      FIREBASE_USER_IMAGE_COVER: ""
    });
  }

  Future<String> _uploadFile(UserModel user, File file) async {
    final StorageReference ref =
        storage.ref().child('images').child('image${user.id}.png');
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
