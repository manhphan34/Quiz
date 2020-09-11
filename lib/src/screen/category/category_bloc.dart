import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/data/models/category.dart';
import 'package:quiz/src/data/remote/repo/quiz_repo.dart';
import 'package:quiz/src/screen/category/category_event.dart';
import 'package:quiz/src/screen/category/category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategorySate> {
  var db = AppDatabase.getInstance().modesDao;
  var cats = List<CategoryData>();
  var quantityQuiz;
  var difficulty;
  Dio dio;
  QuizRepository quizRepository;
  LinkedHashMap<String, List<String>> data;

  CategoryBloc() : super(CategoryInitState()) {
    dio = Dio();
    quizRepository = QuizRepository();
  }

  @override
  Stream<CategorySate> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryLoadingEvent) {
      await db.getCategories.then((value) => cats = value);
      yield CategoryLoadedState(cats: cats);
    } else if (event is CategorySelectQuizNumberEvent) {
      yield CategorySelectedQuizNumberState(quantity: event.quantity);
    } else if (event is CategorySelectQuizDifficultyEvent) {
      yield CategorySelectedQuizDifficultyState(difficulty: event.difficulty);
    } else if (event is CategoryLoadNumberQuestionEvent) {
      yield CategoryLoadingNumberQuestionState();
      data = LinkedHashMap<String, List<String>>();
      await quizRepository
          .getNumberQuestionOfCategory(event.catId)
          .then((value) {
        _convertData(value.data);
      });
      yield CategoryLoadedNumberQuestionState(data: data);
    }
  }

  void _convertData(CategoryResponse response) {
    var easy = _getNumberOfQuestion(
        response.categoryQuestionCount.totalEasyQuestionCount);
    var medium = _getNumberOfQuestion(
        response.categoryQuestionCount.totalMediumQuestionCount);
    var hard = _getNumberOfQuestion(
        response.categoryQuestionCount.totalHardQuestionCount);

    if (easy.isNotEmpty) {
      data.putIfAbsent("Easy", () => easy);
    }

    if (medium.isNotEmpty) {
      data.putIfAbsent("Medium", () => medium);
    }
    if (hard.isNotEmpty) {
      data.putIfAbsent("Hard", () => hard);
    }
  }

  List<String> _getNumberOfQuestion(int number) {
    List<String> numbers = List();
    if (number >= 10) numbers.add("10");
    if (number >= 20) numbers.add("20");
    if (number >= 30) numbers.add("30");
    if (number >= 40) numbers.add("40");
    if (number >= 50) numbers.add("50");
    return numbers;
  }
}
