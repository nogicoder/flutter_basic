import 'package:flutter/material.dart';
import 'package:uikit_bycn/uikittheme.dart';

class UIKitTabBarTheme extends AppBarTheme {
  Color activeColor;
  Color defaultColor;
  Color disabledColor;

  UIKitTabBarTheme({
    Color primaryColor,
    Color defaultColor,
    Color disabledColor
  }) {
    this.activeColor ??= uiKitColors.secondary1;
    this.defaultColor ??= uiKitColors.placeholder;
    this.disabledColor ??= uiKitColors.inactive;
  }
}
