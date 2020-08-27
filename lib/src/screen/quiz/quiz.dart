import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quizzes extends StatelessWidget {
  final String difficulty;
  final int quantity;
  final int categoryId;

  Quizzes(
      {@required this.categoryId, @required this.difficulty, @required this.quantity,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Well com"),
    );
  }

}
