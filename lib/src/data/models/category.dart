import 'package:moor_flutter/moor_flutter.dart';
import 'package:quiz/src/data/local/database.dart';
import 'dart:convert';

class CategoryModel {
  int id;
  String name;
  String des;
  String icon;

  CategoryModel({this.id, this.name, this.des, this.icon});

  CategoryCompanion convert() {
    return CategoryCompanion(
      name: Value(this.name),
      description: Value(this.des),
      id: Value(this.id),
      icon: Value(this.icon),
    );
  }
}

List<CategoryCompanion> convertToCategories(List<CategoryModel> cats) {
  var list = List<CategoryCompanion>();
  if (cats == null || cats.isEmpty) return list;
  cats.forEach((e) {
    list.add(e.convert());
  });
  return list;
}

CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) => json.encode(data.toJson());

class CategoryResponse {
  CategoryResponse({
    this.categoryId,
    this.categoryQuestionCount,
  });

  int categoryId;
  CategoryQuestionCount categoryQuestionCount;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    categoryId: json["category_id"],
    categoryQuestionCount: CategoryQuestionCount.fromJson(json["category_question_count"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_question_count": categoryQuestionCount.toJson(),
  };
}

class CategoryQuestionCount {
  CategoryQuestionCount({
    this.totalQuestionCount,
    this.totalEasyQuestionCount,
    this.totalMediumQuestionCount,
    this.totalHardQuestionCount,
  });

  int totalQuestionCount;
  int totalEasyQuestionCount;
  int totalMediumQuestionCount;
  int totalHardQuestionCount;

  factory CategoryQuestionCount.fromJson(Map<String, dynamic> json) => CategoryQuestionCount(
    totalQuestionCount: json["total_question_count"],
    totalEasyQuestionCount: json["total_easy_question_count"],
    totalMediumQuestionCount: json["total_medium_question_count"],
    totalHardQuestionCount: json["total_hard_question_count"],
  );

  Map<String, dynamic> toJson() => {
    "total_question_count": totalQuestionCount,
    "total_easy_question_count": totalEasyQuestionCount,
    "total_medium_question_count": totalMediumQuestionCount,
    "total_hard_question_count": totalHardQuestionCount,
  };
}

