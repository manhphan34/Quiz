import 'package:moor_flutter/moor_flutter.dart';
import 'package:quiz/src/data/local/database.dart';

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
