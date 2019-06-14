import 'package:flutter/material.dart';

class UIKitToggleButtonTheme {
  double borderRadius;
  double borderWidth;

  Color backgroundColor;
  Color textColor;
  Color borderColor;

  Color activatedTextColor;
  Color activatedBorderColor;
  Color activatedBackgroundColor;

  Color disabledTextColor;
  Color disableBorderColor;
  Color disabledBackgroundColor;

  UIKitToggleButtonTheme(
      {this.borderRadius = 20.0,
      this.borderWidth = 2.0,
      this.backgroundColor = Colors.white,
      this.textColor = const Color(0xFFE75113),
      this.borderColor = const Color(0xFFE75113),
      this.activatedBackgroundColor = const Color(0xFFE75113),
      this.activatedTextColor = const Color(0xFFF19771),
      this.activatedBorderColor = Colors.transparent,
      this.disabledBackgroundColor = Colors.white,
      this.disabledTextColor = const Color(0xFFE2E2E2),
      this.disableBorderColor = const Color(0xFFE2E2E2)});
}
