import 'package:dio/dio.dart';
import 'package:quiz/src/data/models/category.dart';
import 'package:quiz/src/data/models/quiz.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://opentdb.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 30000);
    return _ApiClient(dio);
  }

  @GET(
      "api.php?amount={amount}&category={category}&difficulty={difficulty}&type=multiple&encode=base64")
  Future<QuizResponse> getQuiz(
    @Path("amount") int amount,
    @Path("category") int category,
    @Path("difficulty") String difficulty,
  );

  @GET("api_count.php?category={category}")
  Future<CategoryResponse> getNumberQuestionOfCategory(
    @Path("category") int category,
  );
}
