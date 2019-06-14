import 'package:flutter/material.dart';
import 'uikitflatbuttontheme.dart';
import 'uikitoutlinebuttontheme.dart';
import 'uikittextbuttontheme.dart';
import 'uikittogglebuttontheme.dart';

class UIKitButtonThemeData extends ButtonThemeData {
  UIKitFlatButtonTheme buttonTheme;
  UIKitOutlineButtonTheme outlineButtonTheme;
  UIKitTextButtonTheme textButtonTheme;
  UIKitToggleButtonTheme toggleButtonTheme;

  UIKitButtonThemeData(
      {this.buttonTheme,
      this.outlineButtonTheme,
      this.textButtonTheme,
      this.toggleButtonTheme}) {
    this.buttonTheme ??= new UIKitFlatButtonTheme();
    this.outlineButtonTheme ??= new UIKitOutlineButtonTheme();
    this.textButtonTheme ??= new UIKitTextButtonTheme();
    this.toggleButtonTheme ??= new UIKitToggleButtonTheme();
  }
}
