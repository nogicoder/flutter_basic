import 'package:flutter/material.dart';
import 'package:uikit_bycn/uikittheme.dart';

class UIKitHubButton extends StatefulWidget {
  final Color backgroundColor;
  final Color highlightColor;
  final Color iconColor;
  final Color iconHighlightColor;
  final IconData icon;
  final Function onPressed;
  final String label;

  UIKitHubButton(
      {this.backgroundColor,
      this.highlightColor,
      this.iconColor,
      this.iconHighlightColor,
      this.icon,
      this.label,
      this.onPressed});

  @override
  State<UIKitHubButton> createState() => UIKitHubButtonState();
}

class UIKitHubButtonState extends State<UIKitHubButton> {
  Color get _backgroundColor =>
      widget.backgroundColor ??
      Color.fromARGB((255 * 0.15).round(), 231, 81, 19);
  Color get _highlightColor =>
      widget.highlightColor ?? Color.fromARGB((255 * 0.4).round(), 231, 81, 19);
  Color get _iconColor => widget.iconColor ?? uiKitColors.primary;

  Color get _iconHighLightColor => widget.iconHighlightColor ?? _iconColor;

  bool isHighlight = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        borderRadius: BorderRadius.circular(24.0),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.onPressed,
        onHighlightChanged: (highlight) {
          setState(() {
            isHighlight = highlight;
          });
        },
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 5.0),
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: isHighlight ? _highlightColor : _backgroundColor),
                child: Center(
                    child: Icon(
                  widget.icon ?? Icons.add,
                  size: 36.0,
                  color: isHighlight ? _iconHighLightColor : _iconColor,
                ))),
            widget.label != null
                ? Center(
                    child: Text(widget.label,
                        textAlign: TextAlign.center,
                        style:
                            uiKitTextStyles.current.copyWith(fontSize: 14.0)),
                  )
                : Container()
          ],
        ));
  }
}
