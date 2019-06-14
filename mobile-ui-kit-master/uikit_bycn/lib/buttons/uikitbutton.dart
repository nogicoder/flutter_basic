import 'package:flutter/material.dart';
import 'uikitflatbutton.dart';
import 'uikittextbutton.dart';
import 'uikitoutlinebutton.dart';
import 'uikittogglebutton.dart';

enum UIKITBUTTONTYPE { FLAT, OUTLINE, TEXT, TOGGLE }

class UIKitButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final void Function(bool) onStateChanged;
  final UIKITBUTTONTYPE buttonType;

  // Optional custom
  final IconData leftIcon;
  final IconData rightIcon;
  final Widget body;

  UIKitButton(
      {@required this.label,
      @required this.buttonType,
      @required this.onPressed,
      this.onStateChanged,
      this.leftIcon,
      this.rightIcon,
      this.body});

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case UIKITBUTTONTYPE.FLAT:
        return UIKitFlatButton(
            label: this.label,
            onPressed: this.onPressed,
            leftIcon: this.leftIcon,
            rightIcon: this.rightIcon,
            body: this.body);
      case UIKITBUTTONTYPE.OUTLINE:
        return UIKitOutlineButton(
          label: this.label,
          onPressed: this.onPressed,
          leftIcon: this.leftIcon,
          rightIcon: this.rightIcon,
          body: this.body,
        );
      case UIKITBUTTONTYPE.TEXT:
        return UIKitTextButton(
          label: this.label,
          onPressed: this.onPressed,
        );
      case UIKITBUTTONTYPE.TOGGLE:
        return UIKitToggleButton(
          label: this.label,
          onPressed: this.onPressed,
          onStateChanged: this.onStateChanged,
          leftIcon: this.leftIcon,
          rightIcon: this.rightIcon,
        );
    }
    throw (Exception("Don't match any button type"));
  }
}
