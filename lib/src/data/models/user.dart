import 'package:moor_flutter/moor_flutter.dart';
import 'package:quiz/src/data/local/database.dart';

class UserModel {
  int id;
  String name;
  DateTime date;
  String mobile;
  String image = "";
  String imageCover = "";
  int ePoint;
  int mPoint;
  int hPoint;
  int goldPoint;
  int silverPoint;
  int bronzePoint;
  int rankPoint;
  int rank;

  UserModel(
      {this.id,
      this.name,
      this.date,
      this.image,
      this.ePoint,
      this.imageCover,
      this.mPoint,
      this.hPoint,
      this.goldPoint,
      this.bronzePoint,
      this.silverPoint,
      this.rankPoint,
      this.rank,
      this.mobile});

  UserCompanion convert() {
    return UserCompanion(
        id: Value(this.id),
        name: Value(this.name),
        date: Value(this.date),
        image: Value(image),
        ePoint: Value(ePoint),
        mPoint: Value(mPoint),
        hPoint: Value(hPoint),
        bronzePoint: Value(bronzePoint),
        silverPoint: Value(goldPoint),
        goldPoint: Value(goldPoint),
        rankPoint: Value(rankPoint),
        mobile: Value(mobile),
        imageCover: Value(imageCover));
  }
}
