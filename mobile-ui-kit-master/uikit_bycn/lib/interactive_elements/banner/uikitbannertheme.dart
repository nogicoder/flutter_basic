import 'package:flutter/material.dart';

class UIKitBannerTheme {
  Color backgroundColor;

  TextStyle messageStyle;

  UIKitBannerTheme({this.backgroundColor, this.messageStyle}) {
    this.backgroundColor ??= Color(0xFFE4E6E6);
    this.messageStyle ??= TextStyle(color: Color(0xFF555554));
  }
}
