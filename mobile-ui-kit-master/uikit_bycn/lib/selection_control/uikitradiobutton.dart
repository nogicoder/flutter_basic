import 'package:flutter/material.dart';
import 'uikitradiobuttontheme.dart';

class UIKitRadioButton<T> extends StatefulWidget {
  final String label;
  final T value;
  final T groupValue;
  final void Function(T value) onChanged;
  final UIKitRadioButtonTheme radioButtonTheme = UIKitRadioButtonTheme();
  UIKitRadioButton({
    this.label,
    this.value,
    this.groupValue,
    this.onChanged,
  });

  @override
  State<UIKitRadioButton> createState() => new UIKitRadioButtonState();
}

class UIKitRadioButtonState extends State<UIKitRadioButton> {
  bool isEnabled = false;

  UIKitRadioButtonTheme get radioButtonTheme {
    try {
      return widget.radioButtonTheme;
    } catch (e) {
      print(e);
      throw (Exception(
          "Assign UIKitThemeData to App Theme. Ex: \nMaterialApp(\n theme: UIKitThemeData()\n)"));
    }
  }

  @override
  Widget build(BuildContext context) {
    isEnabled = widget.value.hashCode == widget.groupValue.hashCode;
    return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: widget.onChanged != null
            ? () {
                widget.onChanged(widget.value);
              }
            : null,
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.onChanged != null
                        ? (isEnabled
                            ? radioButtonTheme.activeCircleColor
                            : radioButtonTheme.circleColor)
                        : radioButtonTheme.disabledCircleColor,
                    width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            width: 18.0,
            height: 18.0,
            child: Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                  color: isEnabled
                      ? (widget.onChanged != null
                          ? radioButtonTheme.activeCenterCircleColor
                          : radioButtonTheme.disabledCenterCircleColor)
                      : radioButtonTheme.centerCircleColor,
                  border: Border.all(
                      color: widget.onChanged != null
                          ? (isEnabled
                              ? radioButtonTheme.activeBackgroundColor
                              : radioButtonTheme.backgroundColor)
                          : radioButtonTheme.disabledBackgroundColor,
                      width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
            ),
          ),
          widget.label != null
              ? Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(widget.label,
                      style: TextStyle(
                          color: widget.onChanged != null
                              ? Theme.of(context).textTheme.button.color
                              : Theme.of(context).disabledColor,
                          fontFamily:
                              Theme.of(context).textTheme.button.fontFamily,
                          fontSize: Theme.of(context).textTheme.button.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.button.fontWeight)))
              : Row()
        ]));
  }
}
