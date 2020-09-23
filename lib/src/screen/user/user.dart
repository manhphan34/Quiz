import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/user/user_bloc.dart';
import 'package:quiz/src/screen/user/user_event.dart';
import 'package:quiz/src/screen/user/user_state.dart';
import 'package:quiz/src/utils/Constants.dart';
import 'package:quiz/src/utils/utils.dart';
import 'package:quiz/src/widget/loader.dart';

class User extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserState();
  }
}

class _UserState extends State<User> {
  UserData user;
  UserBloc _userBloc;
  List<TitleData> titles = List();
  var picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _userBloc = UserBloc();
    _userBloc.add(UserLoadInformationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => _userBloc,
        child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadedInformationState) {
            user = state.user;
            _userBloc.add(UserGetTitlesEvent());
          } else if (state is UserInitialState || user == null) {
            return Scaffold(
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
          } else if (state is UserGetTitlesState) {
            titles = state.titles;
          } else if (state is UserUpdateStatusTitleState) {
            _userBloc.add(UserGetTitlesEvent());
          }
          print(user.toString());
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ProfileHeader(
                  avatar: _loadImage(user.image),
                  coverImage: _loadImage(user.imageCover),
                  title: user.name,
                  actions: <Widget>[
                    MaterialButton(
                      color: Colors.white,
                      shape: CircleBorder(),
                      elevation: 0,
                      child: Icon(Icons.edit),
                      onPressed: () {
                        _updateImage().then((value) {
                          _userBloc.add(
                              UserUpdateCoverImageEvent(file: File(value)));
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                UserPoint(user),
                TitleInfo(titles, user.mobile),
              ],
            ),
          );
        }),
      ),
    );
  }

  dynamic _loadImage(String path) {
    if (path == null || path.isEmpty) {
      return AssetImage("assets/images/cover.jpg");
    }
    return NetworkImage(path);
  }

  Future<String> _updateImage() async {
    final picketFile = await picker.getImage(source: ImageSource.gallery);
    return picketFile.path;
  }
}

class UserPoint extends StatelessWidget {
  UserData user;
  List<TitleData> titles;

  UserPoint(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.topLeft,
        child: Card(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              child: _buildPoint(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPointItem(String image, int value) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              image,
              width: 30,
              height: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              value.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPoint() {
    if (user != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPointItem("assets/images/score.png", user.rankPoint),
          SizedBox(width: 30),
          _buildPointItem("assets/images/rank.png", user.rank),
          SizedBox(width: 30),
          _buildPointItem("assets/images/bronze.png", user.bronzePoint),
          SizedBox(width: 30),
          _buildPointItem("assets/images/silver.png", user.silverPoint),
          SizedBox(width: 30),
          _buildPointItem("assets/images/gold.png", user.goldPoint),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPointItem("assets/images/score.png", 0),
          SizedBox(width: 30),
          _buildPointItem("assets/images/rank.png", 0),
          SizedBox(width: 30),
          _buildPointItem("assets/images/bronze.png", 0),
          SizedBox(width: 30),
          _buildPointItem("assets/images/silver.png", 0),
          SizedBox(width: 30),
          _buildPointItem("assets/images/gold.png", 0),
        ],
      );
    }
  }
}

class TitleInfo extends StatelessWidget {
  List<TitleData> titles;
  final String mobile;
  int currentId = -1;

  TitleInfo(this.titles, this.mobile) {
    for (int i = 0; i < titles.length; i++) {
      if (titles[i].status == TITLE_IN_USE) {
        currentId = titles[i].id;
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserSignOutState) {
          Timer(Duration(milliseconds: 10), () {
            Navigator.pushReplacementNamed(context, "/intro");
          });
        }
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Title",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Card(
                color: Colors.red,
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.topRight,
                    child: Column(
                      children: _buildTitles(context),
                    )),
              ),
              RaisedButton(
                onPressed: () {
                  context.bloc<UserBloc>().add(UserSignOutEvent());
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                color: Colors.red,
                padding: EdgeInsets.all(8),
                child: Text(
                  "Sign out",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildTitles(BuildContext context) {
    var list = new List<Widget>();
    titles.forEach((element) {
      list.add(_buildItemTitle(context, element));
    });
    return list;
  }

  Widget _buildItemTitle(BuildContext context, TitleData title) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          if (title.status == TITLE_NOT_ACTIVE ||
              title.status == TITLE_IN_USE) {
            return;
          }
          context.bloc<UserBloc>().add(UserUpdateStatusTitleEvent(
              mobile: mobile,
              title: title.title,
              currentTitleId: currentId,
              newTitleId: title.id,
              status: TITLE_IN_USE));
        },
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Image.asset(
                        getAssetImagePath(title.icon),
                        width: 48,
                        height: 48,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Text(
                        title.title,
                        style: TextStyle(
                          fontSize: 16,
                          color: title.status == TITLE_IN_USE
                              ? Colors.red
                              : Colors.black,
                          fontWeight: title.status == TITLE_IN_USE
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black12,
                ),
              ],
            ),
            Visibility(
              visible: title.status == TITLE_NOT_ACTIVE ? true : false,
              child: Container(
                color: Colors.black26,
                width: double.infinity,
                height: 48,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 8),
              height: 48,
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: _buildStatus(title.status),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatus(String status) {
    if (status == TITLE_ACTIVE) {
      return Text(
        "Active",
        style: TextStyle(color: Colors.black, fontSize: 14),
      );
    } else if (status == TITLE_NOT_ACTIVE) {
      return Text(
        "Not Active",
        style: TextStyle(color: Colors.black, fontSize: 14),
      );
    } else {
      return Text(
        "Used",
        style: TextStyle(
            color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
      );
    }
  }
}

class ProfileHeader extends StatelessWidget {
  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatar;
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const ProfileHeader(
      {Key key,
      @required this.coverImage,
      @required this.avatar,
      @required this.title,
      this.subtitle,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: coverImage, fit: BoxFit.cover),
          ),
        ),
        Ink(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
        ),
        if (actions != null)
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 160),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatar,
                radius: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.grey.shade300,
                borderWidth: 4.0,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double borderWidth;

  const Avatar(
      {Key key,
      @required this.image,
      this.borderColor = Colors.grey,
      this.backgroundColor,
      this.radius = 30,
      this.borderWidth = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor != null
            ? backgroundColor
            : Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: radius - borderWidth,
          backgroundImage: image,
        ),
      ),
    );
  }
}
