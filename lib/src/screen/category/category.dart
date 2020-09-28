import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/category/category_bloc.dart';
import 'package:quiz/src/screen/category/category_event.dart';
import 'package:quiz/src/screen/category/category_state.dart';
import 'package:quiz/src/screen/quiz/quiz.dart';
import 'package:quiz/src/utils/toast.dart';
import 'package:quiz/src/widget/loader.dart';
import "package:rate_my_app/rate_my_app.dart";

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    rateApp(context);
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              "assets/images/background.webp",
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 56),
            width: double.infinity,
            height: double.infinity,
            child: Card(
              margin: EdgeInsets.all(0),
              elevation: 0,
              color: Colors.black87,
              child: Categories(),
            ),
          ),
          Container(
            margin: EdgeInsets.all(0),
            width: double.infinity,
            height: 56,
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.black87,
              title: Container(
                padding: EdgeInsets.only(top: 8),
                child: Text("Pick at a topic to challenger"),
              ),
              centerTitle: true,
            ),
          ),
        ]),
      ),
    );
  }

  void rateApp(BuildContext context) {
    RateMyApp _rateMyApp = RateMyApp(
        preferencesPrefix: 'rateQuizApp',
        minDays: 1,
        minLaunches: 3,
        remindDays: 1,
        remindLaunches: 3);

    _rateMyApp.init().then((_) {
      if (_rateMyApp.shouldOpenDialog) {
        //conditions check if user already rated the app
        _rateMyApp.showStarRateDialog(
          context,
          title: 'What do you think about Our App?',
          message: 'Please leave a rating',
          actionsBuilder: (_, stars) {
            return [
              // Returns a list of actions (that will be shown at the bottom of the dialog).
              FlatButton(
                child: Text('Rate now'),
                onPressed: () async {
                  print('Thanks for the ' +
                      (stars == null ? '0' : stars.round().toString()) +
                      ' star(s) !');
                  await _rateMyApp
                      .callEvent(RateMyAppEventType.rateButtonPressed);
                  Navigator.pop<RateMyAppDialogButton>(
                      context, RateMyAppDialogButton.rate);
                },
              ),
            ];
          },
          dialogStyle: DialogStyle(
            titleAlign: TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20.0),
          ),
          starRatingOptions: StarRatingOptions(),
          onDismissed: () =>
              _rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
        );
      }
    });
  }
}

class Categories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoriesState();
  }
}

class _CategoriesState extends State<Categories> {
  static final QUIZ_QUANTITY = "QUIZ_QUANTITY";
  static final QUIZ_DIFFICULTY = "QUIZ_DIFFICULTY";
  var data = List<CategoryData>();
  int quantity = 0;
  String difficulty = "";
  List<String> numbersOfDiff = List();
  LinkedHashMap<String, List<String>> numbers;
  int catId;
  CategoryBloc _categoryBloc;
  var _selectedCount = "";
  var _selectedDiffculty = "";

  @override
  void initState() {
    super.initState();
    _categoryBloc = CategoryBloc();
    _categoryBloc.add(CategoryLoadingEvent());
    numbers = LinkedHashMap<String, List<String>>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _categoryBloc,
      child: BlocBuilder<CategoryBloc, CategorySate>(
        builder: (context, state) {
          if (state is CategoryLoadedState) data = state.cats;
          return _buildGrid();
        },
      ),
    );
  }

  Widget _buildGrid() {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width;
    return GridView.count(
        childAspectRatio: itemWidth / 600,
        crossAxisCount: 4,
        children: _buildItem());
  }

  List<Widget> _buildItem() {
    var list = new List<Widget>();
    for (int i = 0; i < data.length; i++) {
      list.add(_buildCategoryItem(context, i));
    }
    return list;
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    var item = data[index];
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(4),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: InkWell(
              onTap: () {
                _categoryBloc = CategoryBloc();
                showBottomSheet(
                    elevation: 12,
                    backgroundColor: Colors.black12,
                    context: context,
                    builder: (context) {
                      catId = item.id;
                      return _chooseDifficultyAndNumberQuiz(item.name, item.id);
                    });
              },
              child: Image.asset(item.icon),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text(
              item.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _chooseDifficultyAndNumberQuiz(String title, int id) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: double.infinity,
      child: Container(
        color: Colors.white,
        height: 300,
        child: Column(
          children: [_buildHeader(title), _buildSelectNumberQuiz(id, title)],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      width: double.infinity,
      height: 50,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                _categoryBloc.close();
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.cancel),
              iconSize: 24,
            ),
          )
        ],
      ),
      color: Color(0xFFeeeeee),
    );
  }

  Widget _buildSelectNumberQuiz(int id, String title) {
    _categoryBloc.add(CategoryLoadNumberQuestionEvent(catId: catId));
    bool isLoading = true;
    return BlocProvider(
      create: (BuildContext context) {
        return _categoryBloc;
      },
      child: BlocBuilder<CategoryBloc, CategorySate>(
        builder: (context, state) {
          if (state is CategoryLoadingNumberQuestionState) {
          } else if (state is CategorySelectedQuizNumberState) {
            quantity = state.quantity;
            _selectedCount = state.quantity.toString();
          } else if (state is CategorySelectedQuizDifficultyState) {
            difficulty = state.difficulty;
            numbersOfDiff = numbers[difficulty];
            _selectedDiffculty = difficulty;
            _selectedCount = numbersOfDiff[0];
            quantity = int.parse(numbersOfDiff[0]);
            isLoading = false;
          } else if (state is CategoryLoadedNumberQuestionState) {
            numbers = state.data;
            _categoryBloc.add(CategorySelectQuizDifficultyEvent(
                difficulty: numbers.keys.toList()[0]));
          }
          return Container(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 4, top: 16),
                        child: Text(
                          "Select Difficulty",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        child: _textSelectedItem(numbers.keys.toList(),
                            QUIZ_DIFFICULTY, _selectedDiffculty),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 4, top: 8),
                        child: Text(
                          "Select Total Number Of Quiz",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: _textSelectedItem(
                            numbersOfDiff, QUIZ_QUANTITY, _selectedCount),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        padding: EdgeInsets.only(
                            top: 16, bottom: 16, left: 24, right: 24),
                        color: Colors.redAccent,
                        child: Text(
                          "Start Quiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        onPressed: () {
                          if (quantity == 0) {
                            showToast("Please choose the number of quiz !");
                            return;
                          }
                          if (difficulty.isEmpty) {
                            showToast("Please choose the difficult of quiz !");
                            return;
                          }
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Quizzes(
                              quantity: quantity,
                              difficulty: difficulty,
                              categoryId: id,
                              categoryTitle: title,
                            );
                          }));
                        },
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: isLoading,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 250,
                    alignment: Alignment.center,
                    child: Container(
                      width: 50,
                      height: 50,
                      child: LoaderTwo(),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _textSelectedItem(List<String> data, String type, String choose) {
    return Wrap(
      spacing: 10,
      children: List<Widget>.generate(data.length, (index) {
        return ChoiceChip(
          selected: choose == data[index],
          label: Container(
            child: Text(
              data[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          onSelected: (selected) {
            if (type == QUIZ_DIFFICULTY) {
              _categoryBloc.add(
                  CategorySelectQuizDifficultyEvent(difficulty: data[index]));
            } else if (type == QUIZ_QUANTITY) {
              _categoryBloc.add(CategorySelectQuizNumberEvent(
                  quantity: int.parse(data[index])));
            }
            setState(() {
              if (selected) choose = data[index];
            });
          },
          selectedColor: Colors.redAccent,
          backgroundColor: Colors.black54,
        );
      }).toList(),
    );
  }
}
