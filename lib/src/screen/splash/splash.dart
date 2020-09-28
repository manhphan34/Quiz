import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:quiz/src/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AppUpdateInfo _updateInfo;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool _flexibleUpdateAvailable = false;
  AnimationController _controller;
  Animation _animation;

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) => {});
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    if (Platform.isAndroid) {
      navigate();
    } else {
      navigate();
    }
  }

  void navigate() {
    _isRegister().then((value) {
      Timer(
        Duration(seconds: 3),
        () {
          if (!value) {
            Navigator.pushReplacementNamed(context, "/intro");
          } else {
            Navigator.pushReplacementNamed(context, "/home");
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      appBar: null,
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.fill,
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _isRegister() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(IS_REGISTER) ?? false;
  }
}
