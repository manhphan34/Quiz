import 'package:moor_flutter/moor_flutter.dart';
import 'package:quiz/src/data/local/database.dart';

class UserModel {
  int id;
  String name;
  DateTime date;
  String image = "";

  UserModel({this.name, this.date, this.image});

  UserCompanion convert() {
    return UserCompanion(
      name: Value(this.name),
      date: Value(this.date),
      image: Value(image),
    );
  }
}
