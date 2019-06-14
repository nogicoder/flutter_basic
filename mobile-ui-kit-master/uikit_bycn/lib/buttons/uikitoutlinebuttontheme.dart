import 'package:flutter/material.dart';

class UIKitOutlineButtonTheme {
  double borderRadius;
  double borderWidth;

  Color textColor;
  Color borderColor;

  Color highLightTextColor;
  Color highLightBorderColor;

  Color disabledTextColor;
  Color disableBorderColor;

  UIKitOutlineButtonTheme(
      {this.borderRadius = 20.0,
      this.borderWidth = 2.0,
      this.textColor = const Color(0xFFE75113),
      this.borderColor = const Color(0xFFE75113),
      this.highLightTextColor = const Color(0xFFFFB090),
      this.highLightBorderColor = const Color(0xFFFFB090),
      this.disabledTextColor = const Color(0xFFE2E2E2),
      this.disableBorderColor = const Color(0xFFE2E2E2)});
}
