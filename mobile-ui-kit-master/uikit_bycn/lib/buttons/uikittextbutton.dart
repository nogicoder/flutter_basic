import 'package:flutter/material.dart';
import 'uikittextbuttontheme.dart';

class UIKitTextButton extends StatefulWidget {
  final String label;
  final void Function() onPressed;
  final UIKitTextButtonTheme buttonTheme = UIKitTextButtonTheme();
  UIKitTextButton({@required this.label, @required this.onPressed});

  @override
  UIKitTextButtonState createState() => UIKitTextButtonState();
}

class UIKitTextButtonState extends State<UIKitTextButton> {
  bool _isPressing = false;

  UIKitTextButtonTheme get buttonTheme {
    try {
      return widget.buttonTheme;
    } catch (e) {
      print(e);
      throw (Exception(
          "Assign UIKitButtonThemeData to App Theme. Ex: \nMaterialApp(\n theme: ThemeData(buttonTheme: UIKitButtonThemeData())\n)"));
    }
  }

  _getButton({child}) {
    return FlatButton(
        color: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        disabledColor: Colors.transparent,
        textColor: buttonTheme.textColor,
        onHighlightChanged: (status) {
          setState(() {
            _isPressing = status;
          });
        },
        onPressed: widget.onPressed,
        child: new Text(
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
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _getButton();
  }
}
