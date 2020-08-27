import 'package:equatable/equatable.dart';

class CategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoryLoadingEvent extends CategoryEvent {}

class CategoryLoadedEvent extends CategoryEvent {}

class CategorySelectQuizNumberEvent extends CategoryEvent {
  final int quantity;

  CategorySelectQuizNumberEvent({this.quantity});

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return quantity == other;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

class CategorySelectQuizDifficultyEvent extends CategoryEvent {
  final String difficulty;

  CategorySelectQuizDifficultyEvent({this.difficulty});

  @override
  bool operator ==(Object other) {
    return difficulty == other;
  }

  @override
  int get hashCode => super.hashCode;

}
