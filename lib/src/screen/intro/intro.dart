import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/data/models/Category.dart';

import 'intro_bloc.dart';

final cubit = IntroCubit("");

class Introduce extends StatelessWidget {
  var db = AppDatabase
      .getInstance()
      .modesDao;

  @override
  Widget build(BuildContext context) {
    _initData();
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Intro(),
              Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 150),
                    height: 150,
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Container(
                      margin:
                      EdgeInsets.only(left: 42, right: 42, top: 32, bottom: 32),
                      child: TextIntro()),
                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: Colors.white,
                      padding: EdgeInsets.all(12),
                      onPressed: () {},
                      child: Text(
                        "Join now",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  void _initData() {
    List<CategoryModel> cats = [
      CategoryModel(id: 9, name: "General Knowledge", icon:"assets/images/knowledge.png", des: "Knowledge"),
      CategoryModel(id: 10, name: "Books", icon:"assets/images/book.png", des: "Entertainment"),
      CategoryModel(id: 11, name: "Film", icon:"assets/images/", des: "Entertainment"),
      CategoryModel(id: 12, name: "Music", icon:"assets/images/music.jpg", des: "Entertainment"),
      CategoryModel(
          id: 13, name: "Musicals & Theatres", icon:"assets/images/theater.png", des: "Entertainment"),
      CategoryModel(id: 14, name: "Television", icon:"assets/images/tivi.png", des: "Entertainment"),
      CategoryModel(id: 15, name: "Video Games", icon:"assets/images/video_game.png", des: "Entertainment"),
      CategoryModel(id: 16, name: "Board Games", icon:"assets/images/board_game.png", des: "Entertainment"),
      CategoryModel(id: 17, name: "Science & Nature", icon:"assets/images/nature.png", des: "Science"),
      CategoryModel(id: 18, name: "Computers", icon:"assets/images/computer.png", des: "Science"),
      CategoryModel(id: 19, name: "Mathematics", icon:"assets/images/math/png", des: "Knowledge"),
      CategoryModel(id: 20, name: "Mythology", icon:"assets/images/mythology.png", des: "Knowledge"),
      CategoryModel(id: 21, name: "Sports", icon:"assets/images/sport.png", des: "Entertainment"),
      CategoryModel(id: 22, name: "Geography", icon:"assets/images/geography.png", des: "Knowledge"),
      CategoryModel(id: 23, name: "History", icon:"assets/images/history.png", des: "Knowledge"),
      CategoryModel(id: 24, name: "Politics", icon:"assets/images/politics.png", des: "Science"),
      CategoryModel(id: 25, name: "Art", icon:"assets/images/art.png", des: "Entertainment"),
      CategoryModel(id: 26, name: "Celebrities", icon:"assets/images/celebrity.jpg", des: "Entertainment"),
      CategoryModel(id: 27, name: "Animals", icon:"assets/images/animal.png", des: "Entertainment"),
      CategoryModel(id: 28, name: "Vehicles", icon:"assets/images/vehicles.png", des: "Science"),
      CategoryModel(id: 28, name: "Comics", icon:"assets/images/comic.png", des: "Entertainment"),
      CategoryModel(id: 30, name: "Gadgets", icon: "assets/images/gadgets.png", des: "Science"),
      CategoryModel(id: 31,
          name: "Anime & Manga",
          icon: "assets/images/anime.png",
          des: "Entertainment"),
      CategoryModel(
          id: 32, name: "Cartoon & Animations", icon:"assets/images/cartoon.png", des: "Entertainment"),
    ];

    db.insertCategories(cats: cats);
  }
}

class TextIntro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextIntroState();
  }
}

class _TextIntroState extends State<TextIntro> with TickerProviderStateMixin {
  AnimationController _controller;
  String title = "Chinh phục kho kiến thức khổng lồ thuộc mọi lĩnh vực";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    cubit.listen((state) {
      setState(() {
        print(state);
        title = state;
      });
    });
    return Text(
      title,
      style: GoogleFonts.archivo(
        textStyle: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            height: 1.2),
      ),
      textAlign: TextAlign.center,
    );
//    return LayoutBuilder(
//      builder: (context, contrains) {
//        var biggest = contrains.biggest;
//        return PositionedTransition(
//          rect: RelativeRectTween(
//            begin: RelativeRect.fromSize(
//                Rect.fromLTWH(0, 0, 100, 100), biggest),
//            end: RelativeRect.fromSize(
//                Rect.fromLTWH(100, 100, 100, 100), biggest),
//          ).animate(CurvedAnimation(
//            parent: _controller,
//            curve: Curves.elasticInOut,
//          )),
//          child: Text(
//            title,
//            style: GoogleFonts.archivo(
//              textStyle: TextStyle(
//                  color: Colors.white,
//                  fontSize: 36,
//                  fontWeight: FontWeight.bold,
//                  height: 1.2),
//            ),
//            textAlign: TextAlign.center,
//          ),
//        );
//      },
//    );
  }
}

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateIntro();
  }
}

class _StateIntro extends State<Intro> {
  List<Slide> _slides = new List();
  Function _goToTab;

  void incrementTab() {
    _currentTab++;
  }

  int _currentTab = 0;

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _slides.addAll([
      Slide(
          pathImage: "assets/images/knowledge.webp",
          title: "Knowledge",
          backgroundColor: Color(0xb3373737)),
      Slide(
          pathImage: "assets/images/wonder.webp",
          title: "wonder",
          backgroundColor: Color(0xb3725b53)),
      Slide(
          pathImage: "assets/images/nature.webp",
          title: "nature",
          backgroundColor: Color(0xb3725b53)),
      Slide(
          pathImage: "assets/images/universe.webp",
          title: "universe",
          backgroundColor: Color(0xb3373737))
    ]);
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: IntroSlider(
        slides: _slides,
        isShowDotIndicator: false,
        listCustomTabs: renderSlide(),
        shouldHideStatusBar: true,
        isShowNextBtn: false,
        isShowDoneBtn: false,
        isShowSkipBtn: false,
        colorDot: Colors.white,
        colorActiveDot: Colors.red,
        refFuncGoToTab: (refFunc) {
          this._goToTab = refFunc;
        },
      ),
    );
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentTab < 4) {
        switch (_currentTab) {
          case 1:
            _goToTab(1);
            cubit.statusTwo();
            break;
          case 2:
            _goToTab(2);
            cubit.statusThree();
            break;
          case 3:
            _goToTab(3);
            cubit.statusFour();
            break;
        }
        _currentTab++;
      } else {
        cubit.close();
        timer.cancel();
      }
    });
  }

  void cancelTimer() {
    _timer.cancel();
  }

  List<Widget> renderSlide() {
    List<Widget> tabs = new List();
    for (int i = 0; i < _slides.length; i++) {
      var currentSlides = _slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: ImageIntro(
                  pathImage: currentSlides.pathImage,
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: currentSlides.backgroundColor,
              ),
            ],
          ),
        ),
      );
    }
    return tabs;
  }
}

// ignore: must_be_immutable
class ImageIntro extends StatefulWidget {
  String pathImage;

  ImageIntro({this.pathImage});

  @override
  State<StatefulWidget> createState() {
    return _StateImageIntro(pathImage: pathImage);
  }
}

class _StateImageIntro extends State<ImageIntro> {
  String pathImage;

  _StateImageIntro({this.pathImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//      onHorizontalDragUpdate: (details) {
//        if (details.delta.dx > 0) {
//          print("right swipe");
//        } else if (details.delta.dx < 0) {
//          print("left swipe");
//        }
//      },
      child: Image.asset(
        this.pathImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
