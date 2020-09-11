import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/user/user_bloc.dart';
import 'package:quiz/src/screen/user/user_event.dart';
import 'package:quiz/src/screen/user/user_state.dart';
import 'package:quiz/src/widget/loader.dart';

class User extends StatelessWidget {
  UserData user;
  UserBloc _userBloc;

  User() {
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
          if (state is UserInitialState) {
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
          } else if (state is UserLoadedInformationState) {
            user = state.user;
          }
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
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                UserPoint(context),
                TitleInfo(),
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
    return FileImage(File(path));
  }
}

class UserPoint extends StatelessWidget {
  PointData _pointData;
  UserBloc _userBloc;

  UserPoint(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.add(UserLoadPointEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadedPointState) {
          _pointData = state.point;
        }
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
      },
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
              style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPoint() {
    if (_pointData != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPointItem("assets/images/score.png", _pointData.hPoint),
          SizedBox(width: 30),
          _buildPointItem("assets/images/rank.png", _pointData.hPoint),
          SizedBox(width: 30),
          _buildPointItem("assets/images/bronze.png", _pointData.ePoint),
          SizedBox(width: 30),
          _buildPointItem("assets/images/silver.png", _pointData.mPoint),
          SizedBox(width: 30),
          _buildPointItem("assets/images/gold.png", _pointData.hPoint),
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
  List<TitleData> titles = [
    TitleData(
        icon: "",
        title: "Title 1",
        id: 1,
        ePoint: 1,
        hPoint: 3,
        mPoint: 5,
        isActive: true),
    TitleData(
        icon: "",
        title: "Title 2",
        id: 1,
        ePoint: 1,
        hPoint: 3,
        mPoint: 5,
        isActive: true),
    TitleData(
        icon: "",
        title: "Title 3",
        id: 1,
        ePoint: 1,
        hPoint: 3,
        mPoint: 5,
        isActive: true),
    TitleData(
        icon: "",
        title: "Title 3",
        id: 1,
        ePoint: 1,
        hPoint: 3,
        mPoint: 5,
        isActive: true),
    TitleData(
        icon: "",
        title: "Title 3",
        id: 1,
        ePoint: 1,
        hPoint: 3,
        mPoint: 5,
        isActive: true),
    TitleData(
        icon: "",
        title: "Title 3",
        id: 1,
        ePoint: 1,
        hPoint: 3,
        mPoint: 5,
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.all(15),
                child: Column(
                  children: _buildTitles(),
                )),
          )
        ],
      ),
    );
  }

  List<Widget> _buildTitles() {
    var list = new List<Widget>();
    titles.forEach((element) {
      list.add(_buildItemTitle(element));
    });
    return list;
  }

  Widget _buildItemTitle(TitleData title) {
    return Row(
      children: [
        Container(
          child: Image.asset(
            "assets/images/art.png",
            width: 24,
            height: 24,
          ),
        ),
        Container(
          child: Text(title.title),
        )
      ],
    );
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
