import 'package:flutter/material.dart';
import 'package:uikit_bycn/uikittheme.dart';

class UIKitSwitchTheme {
  Color activeColor;
  Color activeColorLight;
  Color inactiveColor;
  Color inactiveColorLight;
  TextStyle label;
  TextStyle disabledlabel;
  double knobSize;
  double trackHeight;
  double trackWidth;

  UIKitSwitchTheme({
    this.activeColor,
    this.activeColorLight,
    this.inactiveColor,
    this.inactiveColorLight,
    this.label,
    this.disabledlabel,
    this.knobSize,
    this.trackHeight,
    this.trackWidth,
  }) {
    this.activeColor ??= uiKitColors.secondary1;
    this.activeColorLight ??= Color(0xFFA8DDD2);
    this.inactiveColor ??= uiKitColors.button;
    this.inactiveColorLight ??= uiKitColors.application;
    this.label ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      height: 1.5,
      color: uiKitColors.text,
    );
    this.disabledlabel ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      height: 1.5,
      color: uiKitColors.inactive,
    );
    this.knobSize ??= 20.0;
    this.trackHeight ??= 14.0;
    this.trackWidth ??= 34.0;
  }
}
