import 'package:flutter/material.dart';

const String fontFamily = 'Tahoma';

class UIKitColors {
  Color primary;
  Color secondary1;
  Color secondary2;
  Color alert;
  Color success;
  Color button;
  Color text;
  Color placeholder;
  Color application;
  Color statusBar;
  Color inactive;
  Color separator;

  UIKitColors({
    this.primary,
    this.secondary1,
    this.secondary2,
    this.alert,
    this.success,
    this.button,
    this.text,
    this.placeholder,
    this.application,
    this.statusBar,
    this.inactive,
    this.separator,
  }) {
    this.primary ??= const Color(0xFFE75113);
    this.secondary1 ??= const Color(0xFF00A885);
    this.secondary2 ??= const Color(0xFF00B7B5);
    this.alert ??= const Color(0xFFD60D0D);
    this.success ??= const Color(0xFF94C62A);
    this.button ??= const Color(0xFFE4E6E6);
    this.text ??= const Color(0xFF555554);
    this.placeholder ??= const Color(0xFF767676);
    this.application ??= const Color(0xFFEDF0F0);
    this.statusBar ??= const Color(0xFF212121);
    this.inactive ??= const Color(0xFF9C9C9C);
    this.separator ??= const Color(0xFFCECECE);
  }
}

class UIKitTextStyles {
  TextStyle current;
  TextStyle textField;
  TextStyle textFieldLabel;
  TextStyle primaryButtonText;
  TextStyle secondaryButtonText;
  TextStyle headerTitle;
  TextStyle searchField;
  TextStyle cardTitle;
  TextStyle cardSubtitle;
  TextStyle cardText;
  TextStyle popupTitle;
  TextStyle popupText;
  TextStyle blockTitle;

  UIKitTextStyles({
    this.current,
    this.textField,
    this.textFieldLabel,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.headerTitle,
    this.searchField,
    this.cardTitle,
    this.cardSubtitle,
    this.cardText,
    this.popupTitle,
    this.popupText,
    this.blockTitle,
  }) {
    this.current ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      color: uiKitColors.text,
      height: 1.25,
    );
    this.textField ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      color: uiKitColors.inactive,
    );
    this.textFieldLabel ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.0,
      color: uiKitColors.secondary1,
    );
    this.primaryButtonText ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.0,
      color: Colors.white,
    );
    this.secondaryButtonText ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.0,
      color: uiKitColors.primary,
    );
    this.headerTitle ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 18.0,
      color: uiKitColors.placeholder,
      fontWeight: FontWeight.w500,
    );
    this.searchField ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 18.0,
      color: uiKitColors.text,
    );
    this.cardTitle ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 20.0,
      color: uiKitColors.text,
      height: 1.2,
    );
    this.cardSubtitle ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      color: uiKitColors.text,
      height: 1.25,
    );
    this.cardText ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.0,
      color: uiKitColors.text,
      height: 4 / 3,
    );
    this.popupTitle ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 20.0,
      color: uiKitColors.primary,
      height: 1.3,
    );
    this.popupText ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      color: uiKitColors.text,
      height: 11 / 8,
    );
    this.blockTitle ??= TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.0,
      color: uiKitColors.secondary1,
      height: 10 / 7,
    );
  }
}

UIKitColors uiKitColors = UIKitColors();
UIKitTextStyles uiKitTextStyles = UIKitTextStyles();
