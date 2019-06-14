import 'package:flutter/material.dart';
import 'package:uikit_bycn/uikittheme.dart';

class UIKitFlatButtonTheme {
  Color textColor;
  Color backgroundColor;

  Color highLightTextColor;
  Color highlightBackgroundColor;

  Color disabledTextColor;
  Color disabledBackgroundColor;

  UIKitFlatButtonTheme(
      {this.textColor,
      this.backgroundColor,
      this.highLightTextColor,
      this.highlightBackgroundColor,
      this.disabledTextColor,
      this.disabledBackgroundColor}) {
    this.textColor ??= Colors.white;
    this.backgroundColor ??= uiKitColors.primary;
    this.highLightTextColor = Colors.white;
    this.highlightBackgroundColor = const Color(0xFFF19771);
    this.disabledTextColor = Colors.white;
    this.disabledBackgroundColor = const Color(0xFFE2E2E2);
  }
}
