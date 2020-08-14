import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class Introduce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Intro());
  }
}

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateIntro();
  }
}

class _StateIntro extends State<Intro> {
  List<Slide> slides = new List();
  Function goToTab;

  Function onTabChangeComplete;

  void incrementTab() {
    currentTab++;
  }

  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    slides.addAll([
      Slide(pathImage: "assets/images/knowledge.jpg", title: "Knowledge",description: "Knowledge"),
      Slide(pathImage: "assets/images/nature.jpg", title: "nature", description: "nature"),
      Slide(pathImage: "assets/images/person.jpg", title: "person",description: ""),
      Slide(pathImage: "assets/images/universe.jpg", title: "universe",description: "")
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      listCustomTabs: renderSlide(),
      shouldHideStatusBar: true,
      isShowNextBtn: false,
      isShowPrevBtn: false,
      isShowSkipBtn: false,
      onTabChangeCompleted: onTabChangeComplete,
      colorDot: Colors.white,
      colorActiveDot: Colors.red,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },
    );
  }

  List<Widget> renderSlide() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      var currentSlides = slides[i];
      tabs.add(
        Container(
            color: Colors.red,
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                ImageIntro(
                  pathImage: currentSlides.pathImage,
                ),
                Text(currentSlides.description)
              ],
            )),
      );
    }
    return tabs;
  }
}

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
  double _scale = 1.0;
  double _opacity = 1.0;

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
