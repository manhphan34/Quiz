
import 'package:quiz/src/data/local/database.dart';

class Result {
  QuizData quizData;
  int correctAns;
  int answer;

  Result({this.quizData, this.answer, this.correctAns});

  String getAns(int ans) {
    switch (ans) {
      case 1:
        return quizData.A;
      case 2:
        return quizData.B;
      case 3:
        return quizData.C;
      case 4:
        return quizData.D;
    }
    return "";
  }
}
