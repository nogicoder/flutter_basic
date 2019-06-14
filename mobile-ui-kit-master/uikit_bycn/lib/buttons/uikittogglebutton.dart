import 'package:flutter/material.dart';
import 'uikittogglebuttontheme.dart';

class UIKitToggleButton extends StatefulWidget {
  final String label;
  final void Function() onPressed;
  final void Function(bool) onStateChanged;
  final UIKitToggleButtonTheme buttonTheme = UIKitToggleButtonTheme();

  // Optional
  final IconData leftIcon;
  final IconData rightIcon;
  final Widget body;

  UIKitToggleButton(
      {@required this.label,
      @required this.onPressed,
      this.onStateChanged,
      this.leftIcon,
      this.rightIcon,
      this.body});

  @override
  UIKitToggleButtonState createState() => UIKitToggleButtonState();
}

class UIKitToggleButtonState extends State<UIKitToggleButton> {
  bool _isActivated = false;

  UIKitToggleButtonTheme get buttonTheme {
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
              ? (_isActivated
                  ? buttonTheme.activatedTextColor
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
              color: _isActivated
                  ? buttonTheme.activatedTextColor
                  : buttonTheme.textColor,
            ))
        : Container();
  }

  Widget getRightIcon() {
    return widget.rightIcon != null
        ? Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              widget.rightIcon,
              size: 18.0,
              color: _isActivated
                  ? buttonTheme.activatedTextColor
                  : buttonTheme.textColor,
            ),
          )
        : Container();
  }

  _getButton({child}) {
    return FlatButton(
      color: widget.onPressed != null
          ? (_isActivated
              ? buttonTheme.activatedBackgroundColor
              : buttonTheme.backgroundColor)
          : buttonTheme.disabledBackgroundColor,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(buttonTheme.borderRadius),
          side: new BorderSide(
              style: BorderStyle.solid,
              width: buttonTheme.borderWidth,
              color: widget.onPressed != null
                  ? (_isActivated
                      ? buttonTheme.activatedBorderColor
                      : buttonTheme.borderColor)
                  : buttonTheme.disableBorderColor)),
      splashColor: Colors.transparent,
      highlightColor: !_isActivated
          ? buttonTheme.backgroundColor
          : buttonTheme.activatedBackgroundColor,
      disabledColor: Colors.white,
      textColor: buttonTheme.textColor,
      onPressed: widget.onPressed != null
          ? () {
              setState(() {
                _isActivated = !_isActivated;
                if (widget.onStateChanged != null)
                  widget.onStateChanged(_isActivated);
              });
              widget.onPressed();
            }
          : null,
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
