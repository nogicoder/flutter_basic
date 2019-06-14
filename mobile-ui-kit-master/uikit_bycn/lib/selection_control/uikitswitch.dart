import 'package:flutter/material.dart';
import 'uikitswitchtheme.dart';

class UIKitSwitch extends StatefulWidget {
  final String label;
  final bool value;
  final void Function(bool value) onChanged;
  final UIKitSwitchTheme theme = UIKitSwitchTheme();

  UIKitSwitch({this.label, this.value, this.onChanged});

  @override
  State<UIKitSwitch> createState() => new UIKitSwitchState();
}

class UIKitSwitchState extends State<UIKitSwitch> {
  UIKitSwitchTheme theme;
  Color activeColor;
  Color activeTrackColor;
  Color inactiveColor;
  Color inactiveTrackColor;

  Widget _renderLabel() {
    return widget.label != null
        ? Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              widget.label,
              style:
                  widget.onChanged != null ? theme.label : theme.disabledlabel,
            ),
          )
        : Row();
  }

  Widget _renderSwitch() {
    return InkWell(
      onTap: widget.onChanged != null
          ? () {
              widget.onChanged(!widget.value);
            }
          : null,
      splashColor: Colors.transparent,
      child: Stack(
        alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        children: <Widget>[
          Container(
            height: theme.trackHeight,
            width: theme.trackWidth,
            decoration: BoxDecoration(
              color: widget.value ? activeTrackColor : inactiveTrackColor,
              borderRadius: BorderRadius.all(
                Radius.circular(theme.trackHeight),
              ),
            ),
          ),
          Container(
            height: theme.knobSize,
            width: theme.knobSize,
            decoration: BoxDecoration(
              color: widget.value ? activeColor : inactiveColor,
              boxShadow: [
                BoxShadow(
                    color: Color(0x1F000000),
                    blurRadius: 1.0,
                    spreadRadius: 1.0)
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(theme.knobSize),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = widget.theme;
    activeColor =
        widget.onChanged != null ? theme.activeColor : theme.activeColorLight;
    activeTrackColor = widget.onChanged != null
        ? theme.activeColorLight
        : theme.activeColor.withAlpha(0x26);
    inactiveColor = Color(0xFFF2F2F2);
    inactiveTrackColor = widget.onChanged != null
        ? theme.inactiveColor
        : theme.inactiveColorLight;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[_renderSwitch(), _renderLabel()],
      ),
    );
  }
}
