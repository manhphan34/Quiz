import 'package:quiz/src/data/local/database.dart';

class QuizState {}

class QuizInitialState extends QuizState {}

class LoadQuizSuccessState extends QuizState {
  final quizzes;

  LoadQuizSuccessState({this.quizzes});
}

class LoadQuizFailed extends QuizState {}

class UpdateTimerState extends QuizState {
  final int time;

  UpdateTimerState({this.time});
}

class UserUseItemState extends QuizState {
  final ItemData item;
  final bool isSingle;

  UserUseItemState(this.item, this.isSingle);
}

class UserUseSingleItemState extends QuizState {
}