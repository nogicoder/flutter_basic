import 'package:flutter/material.dart';

class UIKitBottomNavBarTheme {
  double fontSize;
  Color backgroundColor;
  Color activeColor;
  Color inactiveColor;
  Color inactiveColorLight;
  BoxShadow boxShadow;
  UIKitBottomNavBarTheme(
      {this.fontSize,
      this.backgroundColor,
      this.activeColor,
      this.inactiveColor,
      this.inactiveColorLight,
      this.boxShadow}) {
    this.fontSize ??= 10.0;
    this.backgroundColor ??= Colors.white;
    this.activeColor ??= Color(0xFFE75113);
    this.inactiveColor ??= Color(0xFF9C9C9C);
    this.inactiveColorLight ??= Color(0xFFCECECE);
    this.boxShadow ??=
        BoxShadow(color: Color(0x29000000), blurRadius: 3.0, spreadRadius: 4.0);
  }
}
