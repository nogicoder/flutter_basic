import 'package:flutter/material.dart';
import 'package:uikit_bycn/uikittheme.dart';

class UIKitChipTheme {
  Color activeColor;
  Color defaultColor;
  Color disabledColor;
  Color backgroundColor;

  UIKitChipTheme({
    this.activeColor,
    this.defaultColor,
    this.disabledColor,
    this.backgroundColor,
  }) {
    this.activeColor ??= uiKitColors.secondary1;
    this.defaultColor ??= uiKitColors.inactive;
    this.disabledColor ??= uiKitColors.button;
    this.backgroundColor ??= activeColor.withAlpha(26);
  }
}
