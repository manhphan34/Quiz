import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/icons/app_icons.dart';
import 'package:quiz/src/screen/category/category.dart';
import 'package:quiz/src/screen/rank/rank.dart';
import 'package:quiz/src/screen/store/store.dart';
import 'package:quiz/src/screen/user/user.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNav());
  }
}

class BottomNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavSate();
  }
}

class _BottomNavSate extends State<BottomNav> {
  int _currentIndex = 0;

  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            Category(),
            Store(),
            User(),
            Rank(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _controller.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              title: Text("Home"),
              icon: Icon(Icons.home),
              inactiveColor: Colors.black,
              activeColor: Colors.red),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              title: Text("Store"),
              icon: Icon(Icons.store),
              inactiveColor: Colors.black,
              activeColor: Colors.red[200]),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              title: Text("User"),
              icon: Icon(Icons.person),
              inactiveColor: Colors.black,
              activeColor: Colors.pink),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              title: Text("Rank"),
              icon: Icon(AppIcons.podium),
              activeColor: Colors.green,
              inactiveColor: Colors.black)
        ],
      ),
    );
  }
}
