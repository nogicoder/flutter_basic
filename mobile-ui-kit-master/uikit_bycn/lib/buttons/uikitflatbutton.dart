import 'package:flutter/material.dart';
import 'package:uikit_bycn/buttons/uikitflatbuttontheme.dart';

class UIKitFlatButton extends StatefulWidget {
  final String label;
  final void Function() onPressed;
  final UIKitFlatButtonTheme buttonTheme = UIKitFlatButtonTheme();

  // Optional
  final IconData leftIcon;
  final IconData rightIcon;
  final Widget body;

  UIKitFlatButton(
      {@required this.label,
      @required this.onPressed,
      this.leftIcon,
      this.rightIcon,
      this.body});

  @override
  UIKitFlatButtonState createState() => UIKitFlatButtonState();
}

class UIKitFlatButtonState extends State<UIKitFlatButton> {
  bool _isPressing = false;

  UIKitFlatButtonTheme get buttonTheme {
    try {
      return widget.buttonTheme;
    } catch (e) {
      print(e);
      throw (Exception(
          "Assign UIKitButtonThemeData to App Theme. Ex: \nMaterialApp(\n theme: ThemeData(buttonTheme: UIKitButtonThemeData())\n)"));
    }
  }

  Widget getLabel() {
    return new Text(
      widget.label.toUpperCase(),
      style: new TextStyle(
          color: widget.onPressed != null
              ? (_isPressing
                  ? buttonTheme.highLightTextColor
                  : buttonTheme.textColor)
              : buttonTheme.disabledTextColor,
          fontFamily: Theme.of(context).textTheme.button.fontFamily,
          fontSize: Theme.of(context).textTheme.button.fontSize,
          fontWeight: Theme.of(context).textTheme.button.fontWeight),
      textAlign: TextAlign.center,
    );
  }

  Widget getLeftIcon() {
    return widget.leftIcon != null
        ? Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              widget.leftIcon,
              size: 18.0,
              color: _isPressing
                  ? buttonTheme.highLightTextColor
                  : buttonTheme.textColor,
            ),
          )
        : Container();
  }

  Widget getRightIcon() {
    return widget.rightIcon != null
        ? Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              widget.rightIcon,
              size: 18.0,
              color: _isPressing
                  ? buttonTheme.highLightTextColor
                  : buttonTheme.textColor,
            ),
          )
        : Container();
  }

  _getButton({child}) {
    return FlatButton(
      color: buttonTheme.backgroundColor,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(20.0),
      ),
      splashColor: Colors.transparent,
      highlightColor: buttonTheme.highlightBackgroundColor,
      disabledColor: buttonTheme.disabledBackgroundColor,
      textColor: buttonTheme.textColor,
      onHighlightChanged: (status) {
        setState(() {
          _isPressing = status;
        });
      },
      onPressed: widget.onPressed,
      child: widget.body ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[getLeftIcon(), getLabel(), getRightIcon()],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getButton();
  }
}
