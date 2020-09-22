import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  int duration = 0;

  CountDownTimer({this.duration});

  _CountDownTimerState __countDownTimerState =
      _CountDownTimerState(duration: 10);

  @override
  _CountDownTimerState createState() {
    return __countDownTimerState;
  }

  void startTimer(int duration) {
    __countDownTimerState.startTimer(duration);
  }

  void stopTimer() {
    __countDownTimerState.stopTimer();
  }

  int getTime() => __countDownTimerState.getTime();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController controller;
  int duration = 0;
  int callback;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  int getTime() {
    return (controller.duration * controller.value).inSeconds;
  }

  _CountDownTimerState({this.duration}) {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: duration),
    );
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
  }

  void stopTimer() {
    controller.stop(canceled: true);
  }

  void startTimer(int duration) {
    controller.duration = Duration(seconds: duration);
    controller.reverse(from: 1.0);
  }

  Future<int> registerCallback() async {
    controller.addStatusListener((status) async {
      print(status);
      if (status == AnimationStatus.dismissed) {
        return 1;
      }
    });
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white10,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: CustomPaint(
                                      painter: CustomTimerPainter(
                                    animation: controller,
                                    backgroundColor: Colors.white,
                                    color: themeData.indicatorColor,
                                  )),
                                ),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        timerString,
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    if(controller.isAnimating){
      controller.dispose();
    }
    super.dispose();
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
