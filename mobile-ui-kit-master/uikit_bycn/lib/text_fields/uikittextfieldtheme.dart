import 'package:flutter/material.dart';
import 'package:uikit_bycn/uikittheme.dart';

class UIKitTextFieldTheme {
  TextStyle textField;
  TextStyle textFieldLabel;
  Color activeColor;
  Color defaultColor;
  Color disabledColor;
  Color errorColor;
  UIKitTextFieldTheme({
    this.textField,
    this.textFieldLabel,
    this.activeColor,
    this.defaultColor,
    this.disabledColor,
    this.errorColor,
  }) {
    this.textField ??= uiKitTextStyles.textField;
    this.textFieldLabel ??= uiKitTextStyles.textFieldLabel;
    this.activeColor ??= uiKitColors.secondary1;
    this.defaultColor ??= uiKitColors.inactive;
    this.disabledColor ??= uiKitColors.application;
    this.errorColor ??= uiKitColors.alert;
  }
}