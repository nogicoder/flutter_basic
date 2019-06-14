import 'package:flutter/material.dart';

class UIKitRadioButtonTheme {
  Color textColor;
  Color circleColor;
  Color centerCircleColor;
  Color backgroundColor;

  Color activeTextColor;
  Color activeCircleColor;
  Color activeCenterCircleColor;
  Color activeBackgroundColor;

  Color disabledTextColor;
  Color disabledCircleColor;
  Color disabledCenterCircleColor;
  Color disabledBackgroundColor;

  UIKitRadioButtonTheme(
      {this.textColor = const Color(0xFF555554),
      this.backgroundColor = Colors.white,
      this.circleColor = const Color(0xFF9C9C9C),
      this.centerCircleColor = Colors.white,
      this.activeTextColor = const Color(0xFF555554),
      this.activeBackgroundColor = Colors.white,
      this.activeCircleColor = const Color(0xFF00A885),
      this.activeCenterCircleColor = const Color(0xFF00A885),
      this.disabledTextColor = const Color(0xFFCECECE),
      this.disabledBackgroundColor = Colors.white,
      this.disabledCircleColor = const Color(0xFFE4E6E6),
      this.disabledCenterCircleColor = const Color(0xFFE4E6E6)});
}
