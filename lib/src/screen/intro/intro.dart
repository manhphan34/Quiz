import 'dart:async';
import 'dart:io';

import 'package:firebase_auth_ui/firebase_auth_ui.dart';
import 'package:firebase_auth_ui/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import 'package:quiz/src/widget/loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'intro_cubit.dart';
import 'intro_event.dart';
import 'intro_state.dart';

final cubit = IntroCubit("");

class Introduce extends StatelessWidget {
  final db = AppDatabase.getInstance().modesDao;
  String phoneNumber;
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    _init();
    return Scaffold(
      body: BlocProvider(
        create: (context) => IntroBloc(),
        child: BlocBuilder<IntroBloc, IntroState>(
          builder: (context, state) {
            if (state is PhoneNumberIsExistsState) {
              showToast("Phone number is exists");
            } else if (state is PhoneNumberIsNotExistsSate) {
              isProcessing = false;
              showToast("Account does not exist. Please try again");
            } else if (state is PhoneNumberIsValidState) {
              Timer(Duration(milliseconds: 30), () {
                showDialog(
                  context: context,
                  builder: (context) => RegisterDialog(
                    phone: phoneNumber,
                  ),
                );
              });
            } else if (state is LoginSuccessState) {
              _updateLogin();
              Timer(Duration(milliseconds: 30), () {
                Navigator.pushReplacementNamed(context, "/home");
              });
            } else if (state is ProcessingState) {
              print("processing");
              isProcessing = true;
            }
            return Container(
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
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 32, left: 32),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton.icon(
                            icon: Container(
                              margin: EdgeInsets.only(right: 48),
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            onPressed: () {
                              FirebaseAuthUi.instance().launchAuth(
                                  [AuthProvider.phone()]).then((value) {
                                if (value != null) {
                                  print(value.phoneNumber);
                                  phoneNumber = value.phoneNumber;
                                  context.bloc<IntroBloc>().add(
                                      LoginPhoneNumberEvent(
                                          phoneNumber: value.phoneNumber));
                                }
                              }).catchError((err) {
                                print(err);
                                showToast(
                                    "Server error. Please try again later!");
                              });
                            },
                            color: Colors.green,
                            label: Text(
                              "Sign in with Phone",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          FirebaseAuthUi.instance()
                              .launchAuth([AuthProvider.phone()]).then((value) {
                            if (value != null) {
                              print(value.phoneNumber);
                              phoneNumber = value.phoneNumber;
                              context.bloc<IntroBloc>().add(
                                  ValidatePhoneNumberEvent(
                                      phoneNumber: value.phoneNumber));
                            }
                          }).catchError((err) {
                            print(err);
                            showToast("Server error. Please try again later!");
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 32, top: 8),
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "You don't have an account ? Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: isProcessing,
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Visibility(
                        visible: isProcessing,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.all(16),
                          width: 80,
                          height: 80,
                          child: LoaderTwo(),
                        ),
                      ),
                    ),
                  )
                ],
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

  void _init() async {
    var share = await SharedPreferences.getInstance();
    var isInitData = share.getBool(IS_INIT_DATA) ?? false;

    if (!isInitData) {
      share.setBool(IS_INIT_DATA, true);
      _initData();
      _initItems();
      _initTitle();
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

  void _initTitle() {
    var list = [
      TitleCompanion(
          id: moor.Value(1),
          mPoint: moor.Value(0),
          ePoint: moor.Value(1),
          hPoint: moor.Value(0),
          title: moor.Value("Beginner I"),
          icon: moor.Value("beginner1.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(2),
          mPoint: moor.Value(0),
          ePoint: moor.Value(11),
          hPoint: moor.Value(0),
          title: moor.Value("Beginner II"),
          icon: moor.Value("beginner2.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(3),
          mPoint: moor.Value(0),
          ePoint: moor.Value(21),
          hPoint: moor.Value(0),
          title: moor.Value("Beginner III"),
          icon: moor.Value("beginner3.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(4),
          mPoint: moor.Value(50),
          ePoint: moor.Value(250),
          hPoint: moor.Value(0),
          title: moor.Value("Advance I"),
          icon: moor.Value("ad1.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(5),
          mPoint: moor.Value(150),
          ePoint: moor.Value(350),
          hPoint: moor.Value(0),
          title: moor.Value("Advance II"),
          icon: moor.Value("ad2.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(6),
          mPoint: moor.Value(300),
          ePoint: moor.Value(500),
          hPoint: moor.Value(0),
          title: moor.Value("Advance III"),
          icon: moor.Value("ad3.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(7),
          mPoint: moor.Value(400),
          ePoint: moor.Value(500),
          hPoint: moor.Value(50),
          title: moor.Value("Professional I"),
          icon: moor.Value("pro1.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(8),
          mPoint: moor.Value(500),
          ePoint: moor.Value(500),
          hPoint: moor.Value(150),
          title: moor.Value("Professional II"),
          icon: moor.Value("pro2.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(9),
          mPoint: moor.Value(600),
          ePoint: moor.Value(500),
          hPoint: moor.Value(350),
          title: moor.Value("Professional III"),
          icon: moor.Value("pro3.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(10),
          mPoint: moor.Value(600),
          ePoint: moor.Value(500),
          hPoint: moor.Value(800),
          title: moor.Value("Expert I"),
          icon: moor.Value("expert1.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(11),
          mPoint: moor.Value(600),
          ePoint: moor.Value(500),
          hPoint: moor.Value(1000),
          title: moor.Value("Expert II"),
          icon: moor.Value("expert2.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
      TitleCompanion(
          id: moor.Value(12),
          mPoint: moor.Value(600),
          ePoint: moor.Value(500),
          hPoint: moor.Value(1500),
          title: moor.Value("Expert III"),
          icon: moor.Value("expert3.png"),
          status: moor.Value(TITLE_NOT_ACTIVE)),
    ];
    db.insertTitles(items: list);
  }
}

class TextIntro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextIntroState();
  }
}

class _TextIntroState extends State<TextIntro> with TickerProviderStateMixin {
  String title = "";

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
            // cubit.statusTwo();
            break;
          case 2:
            _goToTab(2);
            //cubit.statusThree();
            break;
          case 3:
            _goToTab(3);
            //  cubit.statusFour();
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
  final String phone;

  RegisterDialog({@required this.phone});

  @override
  State<StatefulWidget> createState() {
    return _RegisterDialogState(phone: phone);
  }
}

class _RegisterDialogState extends State<RegisterDialog> {
  String _nameController = "";
  String file = "";
  File fileUpload;
  UserData user;
  var picker = ImagePicker();
  IntroBloc introBloc;

  final String phone;

  _RegisterDialogState({@required this.phone});

  @override
  void initState() {
    super.initState();
    introBloc = IntroBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: BlocProvider(
        create: (context) => introBloc,
        child: BlocBuilder<IntroBloc, IntroState>(
          builder: (context, state) {
            if (state is RegisterUserSuccess) {
              Timer(Duration(milliseconds: 300), () {
                _updateLogin();
                Navigator.pushNamed(context, "/home");
              });
              return Container();
            } else if (state is RegisteringUserState) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 16, right: 16),
                width: 80,
                height: 80,
                child: LoaderTwo(),
              );
            } else if (state is PhoneNumberIsExistsState) {
              showToast("Phone number is exists");
            }
            return Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              width: double.infinity,
              height: 380,
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
                              labelText: "Name",
                              labelStyle: TextStyle(fontSize: 16),
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
                              introBloc.add(
                                RegisterUserEvent(
                                    user: UserModel(
                                        id: DateTime.now()
                                            .millisecondsSinceEpoch,
                                        name: _nameController,
                                        image: file,
                                        date: DateTime.now(),
                                        ePoint: 100,
                                        mPoint: 100,
                                        hPoint: 100,
                                        goldPoint: 0,
                                        silverPoint: 0,
                                        bronzePoint: 0,
                                        rankPoint: 0,
                                        mobile: phone),
                                    file: fileUpload,
                                    phoneNumber: phone),
                              );
                            } else {
                              showToast(
                                  "You need to provide your avatar and name");
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
    final picketFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      fileUpload = File(picketFile.path);
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
