import 'package:moor_flutter/moor_flutter.dart';
import 'package:quiz/src/data/local/database.dart';

class PointModel {
  int id;
  int idCat;
  int point;
  DateTime date;

  PointModel({this.idCat, this.point, this.date});

  PointCompanion convert() {
    return PointCompanion(
      idCat: Value(this.idCat),
      point: Value(this.point),
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
