import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/category/category_bloc.dart';
import 'package:quiz/src/screen/category/category_event.dart';
import 'package:quiz/src/screen/category/category_state.dart';

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

  Widget _genderData(List<CategoryData> data) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          var item = data[index];
          return Container(
              color: Colors.red,
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(4),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(item.icon),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }

//
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
            child: Image.asset(item.icon),
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
}
