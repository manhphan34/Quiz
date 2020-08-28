import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/user/user_event.dart';
import 'package:quiz/src/screen/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  var db = AppDatabase.getInstance().modesDao;

  UserBloc(UserState initialState) : super(initialState);

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
    }
  }
}
