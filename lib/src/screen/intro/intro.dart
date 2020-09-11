import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/data/models/category.dart';
import 'package:quiz/src/data/models/user.dart';
import 'package:quiz/src/screen/intro/intro_bloc.dart';
import 'package:quiz/src/utils/Constants.dart';
import 'package:quiz/src/utils/toast.dart';
import 'package:quiz/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'intro_cubit.dart';
import 'intro_event.dart';
import 'intro_state.dart';

final cubit = IntroCubit("");

class Introduce extends StatelessWidget {
  final db = AppDatabase.getInstance().modesDao;

  @override
  Widget build(BuildContext context) {
    _init();
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Intro(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 150,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 150,
                    height: 150,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: 42, right: 42, top: 32, bottom: 32),
                    child: TextIntro()),
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(12),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => BlocProvider<IntroBloc>(
                          create: (context) => IntroBloc(),
                          child: RegisterDialog(),
                        ),
                      );
                    },
                    child: Text(
                      "Join now",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _init() async {
    var share = await SharedPreferences.getInstance();
    var isInitData = share.getBool(IS_INIT_DATA) ?? false;

    if (!isInitData) {
      share.setBool(IS_INIT_DATA, true);
      _initData();
      _initItems();
    }
  }

  void _initData() {
    List<CategoryModel> cats = [
      CategoryModel(
          id: 9,
          name: "General Knowledge",
          icon: "assets/images/knowledge.png",
          des: "Knowledge"),
      CategoryModel(
          id: 10,
          name: "Books",
          icon: "assets/images/book.png",
          des: "Entertainment"),
      CategoryModel(
          id: 11,
          name: "Film",
          icon: "assets/images/film.png",
          des: "Entertainment"),
      CategoryModel(
          id: 12,
          name: "Music",
          icon: "assets/images/music.png",
          des: "Entertainment"),
      CategoryModel(
          id: 13,
          name: "Musicals & Theatres",
          icon: "assets/images/theater.png",
          des: "Entertainment"),
      CategoryModel(
          id: 14,
          name: "Television",
          icon: "assets/images/tivi.png",
          des: "Entertainment"),
      CategoryModel(
          id: 15,
          name: "Video Games",
          icon: "assets/images/video_game.png",
          des: "Entertainment"),
      CategoryModel(
          id: 16,
          name: "Board Games",
          icon: "assets/images/board_game.png",
          des: "Entertainment"),
      CategoryModel(
          id: 17,
          name: "Science & Nature",
          icon: "assets/images/nature.png",
          des: "Science"),
      CategoryModel(
          id: 18,
          name: "Computers",
          icon: "assets/images/computer.png",
          des: "Science"),
      CategoryModel(
          id: 19,
          name: "Mathematics",
          icon: "assets/images/math.png",
          des: "Knowledge"),
      CategoryModel(
          id: 20,
          name: "Mythology",
          icon: "assets/images/mythology.png",
          des: "Knowledge"),
      CategoryModel(
          id: 21,
          name: "Sports",
          icon: "assets/images/sport.png",
          des: "Entertainment"),
      CategoryModel(
          id: 22,
          name: "Geography",
          icon: "assets/images/geography.png",
          des: "Knowledge"),
      CategoryModel(
          id: 23,
          name: "History",
          icon: "assets/images/history.png",
          des: "Knowledge"),
      CategoryModel(
          id: 24,
          name: "Politics",
          icon: "assets/images/politics.png",
          des: "Science"),
      CategoryModel(
          id: 25,
          name: "Art",
          icon: "assets/images/art.png",
          des: "Entertainment"),
      CategoryModel(
          id: 26,
          name: "Celebrities",
          icon: "assets/images/celebrity.png",
          des: "Entertainment"),
      CategoryModel(
          id: 27,
          name: "Animals",
          icon: "assets/images/animal.png",
          des: "Entertainment"),
      CategoryModel(
          id: 28,
          name: "Vehicles",
          icon: "assets/images/vehicles.png",
          des: "Science"),
      CategoryModel(
          id: 29,
          name: "Comics",
          icon: "assets/images/comic.png",
          des: "Entertainment"),
      CategoryModel(
          id: 30,
          name: "Gadgets",
          icon: "assets/images/gadgets.png",
          des: "Science"),
      CategoryModel(
          id: 31,
          name: "Anime & Manga",
          icon: "assets/images/anime.png",
          des: "Entertainment"),
      CategoryModel(
          id: 32,
          name: "Cartoon & Animations",
          icon: "assets/images/cartoon.png",
          des: "Entertainment"),
    ];

    db.insertCategories(cats: cats);
  }

  void _initItems() {
    List<ItemCompanion> items = [
      ItemCompanion(
          id: moor.Value(1),
          quantity: moor.Value(0),
          name: moor.Value("50/50"),
          image: moor.Value(getAssetImagePath("50_50.png")),
          type: moor.Value(SILVER),
          description: moor.Value(
              "Show two incorrect answers. Each question can be used only once"),
          price: moor.Value(15)),
      ItemCompanion(
          id: moor.Value(2),
          quantity: moor.Value(0),
          name: moor.Value("5s"),
          image: moor.Value(getAssetImagePath("5s.png")),
          type: moor.Value(SILVER),
          description: moor.Value(
              "Time to answer questions increased five seconds. Each question can be used only once"),
          price: moor.Value(5)),
      ItemCompanion(
          id: moor.Value(3),
          quantity: moor.Value(0),
          name: moor.Value("Watch"),
          image: moor.Value(getAssetImagePath("watch.png")),
          type: moor.Value(SILVER),
          description: moor.Value(
              "Check an answer is correct or incorrect. Each question can be used only once"),
          price: moor.Value(10)),
      ItemCompanion(
          id: moor.Value(5),
          quantity: moor.Value(0),
          name: moor.Value("Freeze"),
          image: moor.Value(getAssetImagePath("cancel.png")),
          type: moor.Value(GOLD),
          description: moor.Value("Stop time to answer questions."),
          price: moor.Value(20)),
    ];
    db.insertItems(items: items);
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
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    cubit.listen((state) {
      setState(() {
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
      child: Image.asset(
        this.pathImage,
        fit: BoxFit.fill,
      ),
    );
  }
}

class RegisterDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterDialogState();
  }
}

class _RegisterDialogState extends State<RegisterDialog> {
  String _nameController = "";

  String file = "";
  UserData user;
  var picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: BlocProvider(
        create: (context) => IntroBloc(),
        child: BlocBuilder<IntroBloc, IntroState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              width: double.infinity,
              height: 400,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 16,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8)),
                            color: Colors.red,
                          ),
                          margin: EdgeInsets.only(bottom: 24),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50,
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(55)),
                          child: InkWell(
                            splashColor: Colors.white,
                            highlightColor: Colors.white,
                            child: _buildAvatar(),
                            onTap: () {
                              _updateImage();
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 8, left: 8, top: 16, bottom: 32),
                          child: TextField(
                            cursorColor: Colors.red,
                            onChanged: (text) {
                                _nameController = text;
                            },
                            decoration: InputDecoration(
                              labelText: "Họ và tên",
                              labelStyle: TextStyle(fontSize: 20),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.only(
                              left: 32, right: 32, top: 16, bottom: 16),
                          onPressed: () {
                            if (_nameController.isNotEmpty && file.isNotEmpty) {
                              context.bloc<IntroBloc>().add(
                                    RegisterUserEvent(
                                      user: UserModel(
                                          name: _nameController,
                                          image: file,
                                          date: DateTime.now(),
                                          ePoint: 9999,
                                          mPoint: 9999,
                                          hPoint: 9999,
                                          rankPoint: 0),
                                    ),
                                  );
                              _updateLogin();
                              Navigator.pushNamed(context, "/home");
                            } else {
                              showToast(
                                  "You need to provide your name and avatar");
                            }
                          },
                          color: Colors.red,
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _updateLogin() async {
    var shared = await SharedPreferences.getInstance();
    shared.setBool(IS_REGISTER, true);
  }

  void _updateImage() async {
    print("update");
    final picketFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (picketFile != null && picketFile.path != null) file = picketFile.path;
    });
  }

  Widget _buildAvatar() {
    if (file != "") {
      return CircleAvatar(
        radius: 55,
        backgroundColor: Colors.yellowAccent,
        child: CircleAvatar(
          radius: 52,
          backgroundImage: FileImage(File(file)),
        ),
      );
    } else {
      return CircleAvatar(
        radius: 55,
        backgroundColor: Colors.yellowAccent,
        child: CircleAvatar(
          radius: 52,
          backgroundImage: AssetImage(
            "assets/images/add_avatar_1.png",
          ),
        ),
      );
    }
  }
}
