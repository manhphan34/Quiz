import 'package:quiz/src/data/local/database.dart';

class QuizEvent {}

class LoadQuizEvent extends QuizEvent {
  final amount;
  final catId;
  final difficulty;

  LoadQuizEvent({this.amount, this.catId, this.difficulty});
}

class UpdateDateTimerEvent extends QuizEvent {
  final int time;

  UpdateDateTimerEvent(this.time);
}

class UpdateTimeOutEvent extends QuizEvent {
  final bool timeout;

  UpdateTimeOutEvent(this.timeout);
}

class UserUseItemEvent extends QuizEvent {
  final ItemData item;
  final bool isSingle;

  UserUseItemEvent(this.item, this.isSingle);
}
