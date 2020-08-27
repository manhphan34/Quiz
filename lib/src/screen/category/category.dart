import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/category/category_bloc.dart';
import 'package:quiz/src/screen/category/category_event.dart';
import 'package:quiz/src/screen/category/category_state.dart';
import 'package:quiz/src/screen/quiz/quiz.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: _genderCategories(),
          ),
        ),
        Container(
          margin: EdgeInsets.all(0),
          width: double.infinity,
          height: 56,
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.black87,
            title: Text("Pick at a topic to challenger"),
            centerTitle: true,
          ),
        ),
      ]),
    );
  }

  BlocProvider _genderCategories() {
    return BlocProvider<CategoryBloc>(
      create: (context) => CategoryBloc(),
      child: Categories(),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoriesState();
  }
}

class _CategoriesState extends State<Categories> {
  var data = List<CategoryData>();

  @override
  void initState() {
    super.initState();
    context.bloc<CategoryBloc>().add(CategoryLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategorySate>(
      builder: (context, state) {
        if (state is CategoryLoadedState) data = state.cats;
        return _buildGrid();
      },
    );
  }

  Widget _buildGrid() {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height);
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
                showBottomSheet(
                    elevation: 12,
                    backgroundColor: Colors.black12,
                    context: context,
                    builder: (context) {
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
          children: [_buildHeader(title), _buildSelectNumberQuiz(id)],
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

  Widget _buildSelectNumberQuiz(int id) {
    return BlocProvider(
      create: (BuildContext context) {
        return CategoryBloc();
      },
      child: BlocBuilder<CategoryBloc, CategorySate>(
        builder: (context, state) {
          int quantity;
          String difficulty;
          if (state is CategorySelectedQuizNumberState) {
            quantity = state.quantity;
            print(quantity);
          } else if (state is CategorySelectedQuizDifficultyState) {
            difficulty = state.difficulty;
            print(difficulty);
          }
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  child: TextSelectedItem(
                    data: ["10", "20", "30", "40", "50"],
                    type: TextSelectedItem.QUIZ_QUANTITY,
                  ),
                ),
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
                  margin: EdgeInsets.only(bottom: 16),
                  child: TextSelectedItem(
                    data: ["Easy", "Medium", "Hard"],
                    type: TextSelectedItem.QUIZ_DIFFICULTY,
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
                  color: Colors.deepPurple,
                  child: Text(
                    "Start Quiz",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Quizzes(
                        quantity: quantity,
                        difficulty: difficulty,
                        categoryId: id,
                      );
                    }));
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class TextSelectedItem extends StatefulWidget {
  static final QUIZ_QUANTITY = "QUIZ_QUANTITY";
  static final QUIZ_DIFFICULTY = "QUIZ_DIFFICULTY";
  List<String> data;
  var type = QUIZ_QUANTITY;

  TextSelectedItem({this.data, this.type});

  @override
  State<StatefulWidget> createState() {
    return _TextSelectedItemState(data: data, type: this.type);
  }
}

class _TextSelectedItemState extends State<TextSelectedItem> {
  var _selected = "";
  var type = TextSelectedItem.QUIZ_QUANTITY;
  List<String> data;

  _TextSelectedItemState({this.data, this.type});

  var bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.bloc<CategoryBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryBloc>(
      create: (context) {
        return CategoryBloc();
      },
      child: Wrap(
        spacing: 10,
        children: List<Widget>.generate(data.length, (index) {
          return ChoiceChip(
            selected: _selected == data[index],
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
              if (type == TextSelectedItem.QUIZ_DIFFICULTY) {
                bloc.add(
                    CategorySelectQuizDifficultyEvent(difficulty: data[index]));
              } else if (type == TextSelectedItem.QUIZ_QUANTITY) {
                bloc.add(CategorySelectQuizNumberEvent(
                    quantity: int.parse(data[index])));
              }
              setState(() {
                if (selected) _selected = data[index];
              });
            },
            selectedColor: Color(0xFF0d47a1),
            backgroundColor: Colors.black54,
          );
        }).toList(),
      ),
    );
  }

  String getSelected() => _selected;
}
