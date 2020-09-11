import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:quiz/src/data/local/database.dart' as local;
import 'package:quiz/src/data/models/quiz.dart';
import 'package:quiz/src/screen/home/home.dart';
import 'package:quiz/src/screen/quiz/countdown_timer.dart';
import 'package:quiz/src/screen/quiz/quiz_bloc.dart';
import 'package:quiz/src/screen/quiz/quiz_event.dart';
import 'package:quiz/src/screen/quiz/quiz_state.dart';
import 'package:quiz/src/screen/store/store_bloc.dart';
import 'package:quiz/src/screen/store/store_event.dart';
import 'package:quiz/src/screen/store/store_state.dart';
import 'package:quiz/src/screen/user/user_bloc.dart';
import 'package:quiz/src/screen/user/user_event.dart';
import 'package:quiz/src/screen/user/user_state.dart';
import 'package:quiz/src/utils/Constants.dart';
import 'package:quiz/src/utils/toast.dart';
import 'package:quiz/src/utils/utils.dart';
import 'package:quiz/src/widget/loader.dart';

class Quizzes extends StatefulWidget {
  final String difficulty;
  final int quantity;
  final int categoryId;
  final String categoryTitle;

  Quizzes(
      {@required this.categoryId,
      @required this.difficulty,
      @required this.quantity,
      @required this.categoryTitle});

  @override
  State<StatefulWidget> createState() {
    return _QuizzesState(
      quantity: quantity,
      difficulty: difficulty,
      categoryId: categoryId,
      categoryTitle: categoryTitle,
    );
  }
}

class _QuizzesState extends State<Quizzes> {
  final String difficulty;
  final int quantity;
  final int categoryId;
  final String categoryTitle;
  QuizBloc _quizBloc;
  StoreBloc _storeBloc;
  List<Quiz> quizzes = List();
  List<local.ItemData> items = List();
  local.UserData user;

  _QuizzesState(
      {@required this.categoryId,
      @required this.difficulty,
      @required this.quantity,
      @required this.categoryTitle});

  @override
  void initState() {
    super.initState();
    _quizBloc = QuizBloc();
    _storeBloc = StoreBloc();
    _quizBloc.add(LoadQuizEvent(
        amount: quantity, catId: categoryId, difficulty: difficulty));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _quizBloc,
        ),
        BlocProvider(
          create: (context) => _storeBloc,
        )
      ],
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizInitialState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                title: Text(categoryTitle),
                elevation: 0,
              ),
              body: Container(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    child: LoaderTwo(),
                  ),
                ),
              ),
            );
          }

          if (state is LoadQuizFailed) {
            return Scaffold(
              body: Container(
                child: Text("Data is empty. Please choose the "),
              ),
            );
          }
          if (state is LoadQuizSuccessState) {
            quizzes = state.quizzes;
          }
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                title: Text(categoryTitle),
                elevation: 0,
                actions: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return _showItems();
                        },
                      );
                    },
                    child: Image.asset(getAssetImagePath("chest.png")),
                  )
                ],
              ),
              body: Question(
                quizzes: quizzes,
                difficult: difficulty,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _showItems() {
    _storeBloc.add(StoreGetItemEvent());
    var size = MediaQuery.of(context).size;
    return BlocProvider<StoreBloc>.value(
      value: _storeBloc,
      child: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          if (state is StoreGetItemState) {
            items.clear();
            items = state.items;
          }
          return Scaffold(
              backgroundColor: Colors.black12,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 36,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: _buildItems(items),
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }

  List<Widget> _buildItems(List<local.ItemData> items) {
    List<Widget> list = List();
    for (int i = 0; i < items.length; i++) {
      list.add(_buildItem(items[i]));
    }
    return list;
  }

  Widget _buildItem(local.ItemData item) {
    return InkWell(
      onTap: () {
        if (_storeBloc.isHideItem || item.quantity == 0) return;
        _storeBloc.add(
            StoreUpdateItemEvent(id: item.id, quantity: item.quantity - 1));
        Navigator.pop(context);
        if (item.id != ITEM_CHANGE_ID) {
          _quizBloc.add(UserUseItemEvent(item, true));
          _storeBloc.add(UseItemEvent(item, true));
        } else {
          _quizBloc.add(UserUseItemEvent(item, false));
          _storeBloc.add(UseItemEvent(item, false));
        }
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: (_storeBloc.isHideItem || item.quantity == 0)
                ? Colors.grey
                : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.all(4),
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item.image,
              width: 75,
              height: 75,
            ),
            Text(
              "x${item.quantity.toString()}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to quit the quiz? All your progress will be lost."),
            title: Text("Warning!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }
}

class Question extends StatefulWidget {
  List<Quiz> quizzes;
  String difficult;

  Question({this.quizzes, this.difficult});

  @override
  State<StatefulWidget> createState() {
    return _QuestionState(quizzes: quizzes, difficult: difficult);
  }
}

class _QuestionState extends State<Question> {
  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);
  int _currentIndex = 0;
  List<Quiz> quizzes = List();
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  var answers = List<Answer>();
  CountDownTimer _countDownTimer;
  bool isStartTimer = false;
  Timer timer;
  QuizBloc _quizBloc;
  StoreBloc _storeBloc;
  UserBloc _userBloc;
  bool _isCheck = false;
  bool _isUseSingleItem = false;
  local.UserData user;
  String difficult;

  _QuestionState({this.quizzes, this.difficult});

  @override
  void initState() {
    super.initState();
    _quizBloc = context.bloc<QuizBloc>();
    _storeBloc = context.bloc<StoreBloc>();
    _userBloc = UserBloc();
    _countDownTimer = CountDownTimer(
      duration: 10,
    );
    _userBloc.add(UserLoadInformationEvent());
    startTimer(10);
  }

  @override
  Widget build(BuildContext context) {
    if (answers.isEmpty) answers = quizzes[_currentIndex].getAnswer();
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is UpdateTimerState) {
          if (isStartTimer) {
            if (timer.isActive) {
              timer.cancel();
            }
            startTimer(10);
            _countDownTimer.startTimer(10);
            isStartTimer = false;
          }
        } else if (state is UserUseItemState) {
          if (!_isUseSingleItem) {
            _isUseSingleItem = true;
            if (state.item.id == ITEM_WATCH_ID) {
              _useWatchItem();
            } else if (state.item.id == ITEM_FREEZE_ID) {
              _useFreezeItem();
            } else if (state.item.id == ITEM_5S_ID) {
              _userAdd5sItem();
            } else if (state.item.id == ITEM_50_50_ID) {
              _use50_50Item();
            }
          }
        }
        return Stack(
          key: _key,
          children: [
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text("${_currentIndex + 1}"),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          quizzes[_currentIndex].question,
                          softWrap: true,
                          style: _questionStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...answers.map(
                          (option) => RadioListTile(
                            title: InkWell(
                              onTap: () {
                                if (_isCheck) {
                                  _isCheck = false;
                                  setState(() {
                                    var index = answers.indexOf(option);
                                    answers[index].isShowResult = true;
                                  });
                                }
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 40,
                                child: Text("${option.value}"),
                                color: _getColor(
                                    option.isShowResult, option.isResult),
                              ),
                            ),
                            groupValue: _answers[_currentIndex],
                            value: option,
                            onChanged: (value) {
                              setState(() {
                                _answers[_currentIndex] = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    width: double.infinity,
                    height: 150,
                    child: _countDownTimer,
                  )
                ],
              ),
            ),
            Container(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text(_currentIndex == (quizzes.length - 1)
                      ? "Submit"
                      : "Next"),
                  onPressed: _nextSubmit,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _useWatchItem() {
    _isCheck = true;
    showToastSuccess("Please choose an answer title to check");
  }

  void _useFreezeItem() {
    timer.cancel();
    _countDownTimer.stopTimer();
  }

  void _use50_50Item() {
    answers = quizzes[_currentIndex].getAnswer_50_50(answers);
  }

  void _userAdd5sItem() {
    if (timer.isActive) timer.cancel();
    startTimer(_countDownTimer.getTime() + 5);
    _countDownTimer.startTimer(_countDownTimer.getTime() + 5);
  }

  Color _getColor(bool isShowResult, bool isResult) {
    if (!isShowResult) {
      return Colors.white;
    } else {
      if (isResult) {
        return Colors.green[300];
      } else
        return Colors.red[300];
    }
  }

  void startTimer(int time) {
    timer = Timer(Duration(seconds: time), () {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          _quizBloc.add(UpdateTimeOutEvent(true));
          return WillPopScope(
            onWillPop: _onWillPop,
            child: AlertDialog(
              content: new Text("You lost because timeout"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Go Back Home"),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                        (route) => false);
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Future<bool> _onWillPop() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
        (route) => false);
    return false;
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      showToast("You must select an answer to continue.");
      return;
    }
    _isUseSingleItem = false;
    _storeBloc.setHideItem(false);
    if (_currentIndex < quizzes.length - 1) {
      answers = List<Answer>();
      setState(() {
        _currentIndex++;
      });
      isStartTimer = true;
      context.bloc<QuizBloc>().add(UpdateDateTimerEvent(10));
    } else {
      _storeBloc.close();
      _quizBloc.close();
      _countDownTimer.stopTimer();
      timer.cancel();
      var result = _getResult();
      showDialog(
        context: context,
        builder: (context) {
          return _buildResult(result);
        },
      );
    }
  }

  Widget _buildResult(int result) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocProvider(
        create: (context) => _userBloc,
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadedInformationState) {
              user = state.user;
            }
            int ePoint = user.ePoint;
            int mPoint = user.mPoint;
            int hPoint = user.hPoint;
            int rankPoint = user.rankPoint;
            int eResult = 0;
            int mResult = 0;
            int hResult = 0;
            int rankPointResult = 0;

            if (difficult.toLowerCase() == EASY_MODE) {
              ePoint = ePoint + result;
              eResult = result;
              rankPointResult = result;
            } else if (difficult.toLowerCase() == HARD_MODE) {
              hPoint = hPoint + result;
              hResult = result;
              rankPointResult = result * 3;
            } else {
              mPoint = mPoint + result;
              mResult = result;
              rankPointResult = result * 2;
            }

            return Scaffold(
              backgroundColor: Colors.black12,
              body: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  height: 300,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red[500],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8))),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        child: Text(
                          "Result",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, top: 8, bottom: 16),
                        child: Row(
                          children: [
                            Text(
                              "Correct answers:  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " $result/${quizzes.length}",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, bottom: 16),
                        child: Row(
                          children: [
                            Text(
                              "Incorrect answers:  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " ${quizzes.length - result}/${quizzes.length}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildItemResult(
                              getAssetImagePath("bronze.png"), ePoint, eResult),
                          SizedBox(width: 30),
                          _buildItemResult(
                              getAssetImagePath("silver.png"), mPoint, mResult),
                          SizedBox(width: 30),
                          _buildItemResult(
                              getAssetImagePath("gold.png"), hPoint, hResult),
                          SizedBox(width: 30),
                          _buildItemResult(
                              getAssetImagePath("score.png"), rankPoint, rankPointResult),
                        ],
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      FlatButton(
                        padding: EdgeInsets.only(
                            left: 24, right: 24, top: 16, bottom: 16),
                        color: Colors.red[500],
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        onPressed: () {
                          _onWillPop();
                        },
                        child: Text("Back To Home"),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItemResult(String image, int pointCurrent, int pointIncrement) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 4),
          child: Image.asset(
            image,
            width: 30,
            height: 30,
          ),
        ),
        Container(
          child: Row(
            children: [
              Text(
                "${pointCurrent}",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                pointIncrement == 0 ? "" : " (↑$pointIncrement)",
                style: TextStyle(color: Colors.green, fontSize: 16),
              )
            ],
          ),
        )
      ],
    );
  }

  int _getResult() {
    int point = 0;
    for (int i = 0; i < quizzes.length; i++) {
      if (_answers[i].value == quizzes[i].correctAnswer) {
        point = point + 1;
      }
    }
    return point;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
