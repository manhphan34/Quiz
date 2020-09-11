import 'package:moor_flutter/moor_flutter.dart';
import 'package:quiz/src/data/local/database.dart';

class PointModel {
  int id;
  int idCat;
  int ePoint;
  int mPoint;
  int hPoint;
  DateTime date;

  PointModel({this.idCat, this.ePoint, this.hPoint, this.mPoint, this.date});

  PointCompanion convert() {
    return PointCompanion(
      idCat: Value(this.idCat),
      ePoint: Value(this.ePoint),
      mPoint: Value(this.mPoint),
      hPoint: Value(this.hPoint),
      date: Value(this.date),
    );
  }
}

List<PointCompanion> convertToPoints(List<PointModel> points) {
  var list = List<PointCompanion>();
  if (points == null || points.isEmpty) return list;
  points.forEach((e) {
    list.add(e.convert());
  });
  return list;
}
