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
