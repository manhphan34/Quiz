import 'package:flutter/material.dart';
import 'package:quiz/src/screen/category/category.dart';
import 'package:quiz/src/screen/home/home.dart';
import 'package:quiz/src/screen/intro/intro.dart';
import 'package:quiz/src/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/category': (context) => Category(),
        '/home': (context) => Home(),
      },
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "archivo"),
      home: _startApp(),
    );
  }

  Widget _startApp() {
    isFirst().then((value) {
      if (value) {
        return Home();
      } else
        return Introduce();
    });
    return Introduce();
  }

  Future<bool> isFirst() async {
    var shared = await SharedPreferences.getInstance();
    return shared.getBool(IS_REGISTER) ?? false;
  }
}
