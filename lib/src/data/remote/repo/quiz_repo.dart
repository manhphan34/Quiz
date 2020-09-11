import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:quiz/src/data/models/category.dart';
import 'package:quiz/src/data/models/quiz.dart';
import 'package:quiz/src/data/remote/api/api.dart';
import 'package:quiz/src/data/remote/error/error.dart';
import 'package:quiz/src/data/remote/response/base_response.dart';

final logger = Logger();

class QuizRepository {
  Dio dio;
  ApiClient apiClient;

  QuizRepository() {
    dio = new Dio();
    apiClient = ApiClient(dio);
  }

  Future<BaseModel<QuizResponse>> getQuizzes(
      int amount, int catId, String difficulty) async {
    QuizResponse response;
    try {
      response =
          await apiClient.getQuiz(amount, catId, difficulty.toLowerCase());
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<CategoryResponse>> getNumberQuestionOfCategory(int catId) async {
    CategoryResponse response;
    try {
      response =
      await apiClient.getNumberQuestionOfCategory(catId);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
}
