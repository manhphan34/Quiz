import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/models/quiz.dart';
import 'package:quiz/src/data/remote/repo/quiz_repo.dart';
import 'package:quiz/src/screen/quiz/quiz_event.dart';
import 'package:quiz/src/screen/quiz/quiz_state.dart';
import 'package:quiz/src/utils/Constants.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  var repo = QuizRepository();

  QuizBloc() : super(QuizInitialState());

  bool _isTimeout = false;

  bool isHideItem = false;

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    if (event is LoadQuizEvent) {
      var quizzes = List<Quiz>();
      int code;
      await repo
          .getQuizzes(event.amount, event.catId, event.difficulty)
          .then((value) {
        quizzes = value.data.quiz;
        code = value.data.responseCode;
      });
      if (code == 1) {
        yield LoadQuizFailed();
      } else
        yield LoadQuizSuccessState(quizzes: quizzes);
    } else if (event is UpdateDateTimerEvent) {
      yield UpdateTimerState(time: event.time);
    } else if (event is UserUseItemEvent) {
      isHideItem = true;
      yield UserUseItemState(event.item, isHideItem);
    }
  }

  bool getTimeOut() {
    return _isTimeout;
  }
}
