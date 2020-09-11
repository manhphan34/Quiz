import 'package:moor_flutter/moor_flutter.dart';
import 'package:quiz/src/data/local/database.dart';

class UserModel {
  int id;
  String name;
  DateTime date;
  String image = "";
  int ePoint;
  int mPoint;
  int hPoint;
  int rankPoint;

  UserModel({this.name, this.date, this.image, this.ePoint, this.mPoint, this.hPoint, this.rankPoint});

  UserCompanion convert() {
    return UserCompanion(
      name: Value(this.name),
      date: Value(this.date),
      image: Value(image),
      ePoint: Value(ePoint),
      mPoint: Value(mPoint),
      hPoint: Value(hPoint),
      rankPoint: Value(rankPoint)
    );
  }
}
