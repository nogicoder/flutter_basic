import 'package:flutter/material.dart';
import 'package:uikit_bycn/selection_control/uikitcheckboxtheme.dart';

class UIKitCheckbox extends StatefulWidget {
  final String label;
  final void Function(bool value) onChanged;
  final bool value;
  final UIKitChecboxTheme theme = UIKitChecboxTheme();
  UIKitCheckbox({
    this.label,
    this.onChanged,
    this.value,
  });

  @override
  State<UIKitCheckbox> createState() => new UIKitCheckboxState();
}

class UIKitCheckboxState extends State<UIKitCheckbox> {
  @override
  Widget build(BuildContext context) {
    UIKitChecboxTheme theme = widget.theme;
    Color activeBorderColor =
        widget.onChanged != null ? theme.activeColor : theme.disabledColor;
    Color activeFillColor =
        widget.onChanged != null ? theme.activeColor : theme.disabledColor;
    Color inactiveBorderColor =
        widget.onChanged != null ? theme.defaultColor : theme.disabledColor;
    Color inactiveFillColor = Colors.white;
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.onChanged != null
            ? () {
                widget.onChanged(!widget.value);
              }
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: widget.value ? activeFillColor : inactiveFillColor,
                border: Border.all(
                    color:
                        widget.value ? activeBorderColor : inactiveBorderColor,
                    width: theme.borderWidth),
                borderRadius:
                    BorderRadius.all(Radius.circular(theme.borderRadius)),
              ),
              width: theme.size,
              height: theme.size,
              child: widget.value
                  ? Icon(theme.icon,
                      color: Colors.white, size: theme.iconSize ?? 20.0)
                  : Container(),
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
                            fontSize:
                                Theme.of(context).textTheme.button.fontSize,
                            fontWeight:
                                Theme.of(context).textTheme.button.fontWeight)))
                : Row()
          ],
        ));
  }
}
