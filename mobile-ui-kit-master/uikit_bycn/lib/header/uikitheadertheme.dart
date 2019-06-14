import 'package:flutter/material.dart';
import 'package:uikit_bycn/uikittheme.dart';

class UIKitHeaderTheme extends AppBarTheme {
  Brightness brightness;
  Color color;
  double elevation;
  IconThemeData iconTheme;
  IconThemeData actionsIconTheme;
  TextTheme textTheme;

  UIKitHeaderTheme({
    IconThemeData actionsIconTheme,
    Brightness brightness,
    Color color,
    double elevation,
    IconThemeData iconTheme,
    TextTheme textTheme,
  }) {
    this.brightness ??= Brightness.light;
    this.color ??= Colors.white;
    this.elevation ??= 0.0;
    this.iconTheme ??= IconThemeData(
      color: uiKitColors.placeholder,
    );
    this.actionsIconTheme = IconThemeData(
      color: uiKitColors.placeholder,
    );
    this.textTheme ??= TextTheme(
      title: uiKitTextStyles.headerTitle
    );
  }
}
