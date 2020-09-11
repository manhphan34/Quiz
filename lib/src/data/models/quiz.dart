// To parse this JSON data, do
//
//     final quizResponse = quizResponseFromJson(jsonString);

import 'dart:convert';

QuizResponse quizResponseFromJson(String str) =>
    QuizResponse.fromJson(json.decode(str));

String quizResponseToJson(QuizResponse data) => json.encode(data.toJson());

class QuizResponse {
  QuizResponse({
    this.responseCode,
    this.quiz,
  });

  int responseCode;
  List<Quiz> quiz;

  factory QuizResponse.fromJson(Map<String, dynamic> json) => QuizResponse(
        responseCode: json["response_code"],
        quiz: List<Quiz>.from(json["results"].map((x) => Quiz.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "results": List<dynamic>.from(quiz.map((x) => x.toJson())),
      };
}

class Quiz {
  Quiz({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  Category category;
  Type type;
  Difficulty difficulty;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        category: categoryValues.map[json["category"]],
        type: typeValues.map[json["type"]],
        difficulty: difficultyValues.map[json["difficulty"]],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers:
            List<String>.from(json["incorrect_answers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse[category],
        "type": typeValues.reverse[type],
        "difficulty": difficultyValues.reverse[difficulty],
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
      };

  List<Answer> getAnswer() {
    var answers = List<Answer>();
    incorrectAnswers.forEach((element) {
      answers.add(Answer(element, false, false));
    });
    answers.add(Answer(correctAnswer, true, false));
    answers.shuffle();
    return answers;
  }

  List<Answer> getAnswer_50_50(List<Answer> answers) {
    for (int i = 0; i < 2; i++) {
      int j =0;
      for (j = 0; j < 4; j++) {
        if (incorrectAnswers[i] == answers[j].value) {
          answers[j].isShowResult = true;
          break;
        }
      }
    }
    return answers;
  }
}

enum Category { HISTORY }

final categoryValues = EnumValues({"History": Category.HISTORY});

enum Difficulty { HARD }

final difficultyValues = EnumValues({"hard": Difficulty.HARD});

enum Type { MULTIPLE }

final typeValues = EnumValues({"multiple": Type.MULTIPLE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class Answer {
  String value;
  bool isResult;
  bool isShowResult;

  Answer(this.value, this.isResult, this.isShowResult);
}
