import 'package:flutter/cupertino.dart';

class UserRank {
  String mobile;
  String rank;
  String name;
  String title;
  String image;

  UserRank(
      {@required this.mobile,
      @required String rank,
      @required String name,
      @required String title,
      @required String image}) {
    this.rank = rank;
    this.name = name;
    this.title = title;
    this.image = image;
  }
}
