import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/intro/intro_event.dart';

import 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  var db = AppDatabase.getInstance().modesDao;

  IntroBloc() : super(IntroInitState());

  @override
  Stream<IntroState> mapEventToState(IntroEvent event) async* {
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
