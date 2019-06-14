import 'package:flutter/material.dart';
import 'package:uikit_bycn/uikittheme.dart';
class UIKitSliderTheme {
  double sliderWidth;
  double trackHeight;
  double thumbSize;
  double thumbRadius;
  double tooltipHeight;
  double tooltipRadidus;
  EdgeInsets tooltipPadding;
  Color activeColor;
  Color inactiveColor;
  Color inactiveColorLight;
  Color tooltipBackgrounColor;

  UIKitSliderTheme({
    this.sliderWidth,
    this.trackHeight,
    this.thumbSize,
    this.thumbRadius,
    this.tooltipHeight,
    this.tooltipRadidus,
    this.tooltipPadding,
    this.activeColor,
    this.inactiveColor,
    this.inactiveColorLight,
    this.tooltipBackgrounColor,
  }) {
    this.sliderWidth ??= 280.0;
    this.trackHeight ??= 4.0;
    this.thumbSize ??= 20.0;
    this.thumbRadius ??= this.thumbSize / 2;
    this.tooltipHeight ??= 20.0;
    this.tooltipRadidus ??= 4.0;
    this.tooltipPadding ??=
        EdgeInsets.only(top: 4.0, right: 8.0, bottom: 4.0, left: 8.0);
    this.activeColor ??= uiKitColors.secondary1;
    this.inactiveColor ??= uiKitColors.inactive;
    this.inactiveColorLight ??= uiKitColors.button;
    this.tooltipBackgrounColor ??= uiKitColors.placeholder;
  }
}
