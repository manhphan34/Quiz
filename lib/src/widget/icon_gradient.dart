import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadiantGradientMask extends StatelessWidget {
  final List<Color> colors;

  RadiantGradientMask({this.child, this.colors});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: colors)
          .createShader(bounds),
      child: child,
    );
  }
}
