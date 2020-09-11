import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/user/user_event.dart';
import 'package:quiz/src/screen/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  var db = AppDatabase.getInstance().modesDao;

  UserBloc() : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
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
    } else if (event is UserUdpatePointEvent) {
      await db.updateUserPoint(
          event.id, event.ePoint, event.mPoint, event.hPoint);
      var user = await db.getUser;
      yield UserLoadedInformationState(user: user[0]);
    }
  }
}
