import 'package:flutter/material.dart';
import 'package:uikit_bycn/uikittheme.dart';

class UIKitChecboxTheme {
  Color activeColor;
  Color activeColorLight;
  Color defaultColor;
  Color disabledColor;
  double borderRadius;
  double borderWidth;
  double size;
  IconData icon;
  double iconSize;

  UIKitChecboxTheme({
    this.activeColor,
    this.activeColorLight,
    this.defaultColor,
    this.disabledColor,
    this.borderRadius,
    this.borderWidth,
    this.size,
    this.icon,
    this.iconSize,
  }) {
    this.activeColor ??= uiKitColors.secondary1;
    this.activeColorLight ??= this.activeColor.withOpacity(0.3);
    this.defaultColor ??= uiKitColors.inactive;
    this.disabledColor ??= uiKitColors.button;
    this.borderWidth ??= 2.0;
    this.borderRadius ??= 2.0;
    this.size ??= 24.0;
    this.icon ??= Icons.check;
    this.iconSize ??= 20.0;
  }
}
