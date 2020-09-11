import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/src/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _isRegister().then((value) {
      Timer(
        Duration(seconds: 3),
            () {
          if (!value) {
            Navigator.pushNamed(context, "/intro");
          } else {
            Navigator.pushNamed(context, "/home");
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