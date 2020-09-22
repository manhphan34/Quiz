import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/store/store_event.dart';
import 'package:quiz/src/screen/store/store_state.dart';
import 'package:quiz/src/utils/Constants.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreInitialState());
  var db = AppDatabase.getInstance().modesDao;
  DatabaseReference firebaseDb = FirebaseDatabase.instance.reference();

  bool isHideItem = false;

  @override
  Stream<StoreState> mapEventToState(StoreEvent event) async* {
    var user = await db.getUser;
    if (event is StoreGetItemEvent) {
      List<ItemData> data;
      await db.getItems.then((value) => data = value);
      yield StoreGetItemState(items: data);
    } else if (event is StoreUpdateItemEvent) {
      firebaseDb
          .child(FIREBASE_USERS_TABLE)
          .child(user[0].mobile)
          .child(FIREBASE_USER_ITEMS)
          .update({event.id.toString(): event.quantity});
      await db.updateItem(event.id, event.quantity);
      yield StoreUpdateItemState();
    } else if (event is UseItemEvent) {
      isHideItem = true;
    } else if (event is StoreUpdateEvent) {
      isHideItem = false;
    }
  }

  bool getHideItem() => isHideItem;

  void setHideItem(bool isHide) {
    isHideItem = isHide;
  }
}
