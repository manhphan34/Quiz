import 'package:moor_flutter/moor_flutter.dart';
import 'package:quiz/src/data/local/database.dart';

class QuizModel {
  int id;
  int idCat;
  String des;
  String A;
  String B;
  String C;
  String D;
  int result;

  QuizModel(
      {this.idCat, this.des, this.A, this.B, this.C, this.D, this.result});

  QuizCompanion convert() {
    return QuizCompanion(
      description: Value(this.des),
      idCat: Value(this.idCat),
      A: Value(this.A),
      B: Value(this.B),
      C: Value(this.C),
      D: Value(this.D),
      result: Value(this.result),
    );
  }
}

List<dynamic> convertToQuizzes(List<QuizModel> quizzes) {
  var list = List<QuizCompanion>();
  if (quizzes == null || quizzes.isEmpty) return list;
  quizzes.forEach((e) {
    list.add(e.convert());
  });
  return list;
}
