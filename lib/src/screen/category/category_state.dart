import 'package:equatable/equatable.dart';
import 'package:quiz/src/data/local/database.dart';

class CategorySate extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoryInitState extends CategorySate {}

class CategoryLoadingState extends CategorySate {}

class CategoryLoadedState extends CategorySate {
  final List<CategoryData> cats;

  CategoryLoadedState({this.cats});
}

class CategorySelectedQuizNumberState extends CategorySate {
  final int quantity;

  CategorySelectedQuizNumberState({this.quantity});

  @override
  bool operator ==(Object other) {
    return quantity == other;
  }

  @override
  int get hashCode => super.hashCode;
}

class CategorySelectedQuizDifficultyState extends CategorySate {
  final String difficulty;

  CategorySelectedQuizDifficultyState({this.difficulty});

  @override
  bool operator ==(Object other) {
    return difficulty == other;
  }

  @override
  int get hashCode => super.hashCode;
}
