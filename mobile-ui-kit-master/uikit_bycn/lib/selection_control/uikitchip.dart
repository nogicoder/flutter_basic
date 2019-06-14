import 'package:flutter/material.dart';
import 'uikitchiptheme.dart';

class UIKitChip extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool canClose;
  final bool isActivated;
  final void Function(bool value) onTap;
  final void Function() onClose;
  final UIKitChipTheme theme;
  UIKitChip(
      {@required this.canClose,
      @required this.isActivated,
      this.label,
      this.icon,
      this.onTap,
      this.onClose,
      this.theme});

  @override
  State<UIKitChip> createState() => new UIKitChipState();
}

class UIKitChipState extends State<UIKitChip> {
  UIKitChipTheme theme;

  Widget _renderIcon() {
    return widget.icon != null
        ? Container(
            height: 32.0,
            width: 32.0,
            child: Icon(
              widget.icon,
              color: widget.onTap != null
                  ? (widget.isActivated
                      ? theme.activeColor
                      : theme.defaultColor)
                  : theme.disabledColor,
            ),
            margin: EdgeInsets.only(
                left: widget.canClose
                    ? 0.0
                    : (widget.label != null ? 10.0 : 0.0)),
          )
        : Container();
  }

  Widget _renderLabel() {
    return widget.label != null
        ? Container(
            child: Text(widget.label,
                style: TextStyle(
                    color: widget.onTap != null
                        ? (widget.isActivated
                            ? theme.activeColor
                            : theme.defaultColor)
                        : theme.disabledColor,
                    fontFamily: Theme.of(context).textTheme.button.fontFamily,
                    fontSize: Theme.of(context).textTheme.button.fontSize,
                    fontWeight: Theme.of(context).textTheme.button.fontWeight)),
            margin: EdgeInsets.only(
                left:
                    widget.icon != null ? 0.0 : (widget.canClose ? 10.0 : 20.0),
                right: widget.canClose ? 0.0 : 20.0),
          )
        : Container();
  }

  Widget _renderDivider() {
    return (widget.label != null || widget.icon != null) && widget.canClose
        ? Container(
            width: widget.label != null ? 14.0 : 0.0,
            height: 20.0,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        color: widget.onTap != null
                            ? (widget.isActivated
                                ? theme.activeColor
                                : theme.defaultColor)
                            : theme.disabledColor,
                        width: 1.0))))
        : Container();
  }

  Widget _renderClose() {
    return widget.canClose
        ? InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              if (widget.onTap == null) {
                return;
              }
              widget.onClose();
            },
            child: Container(
              height: 32.0,
              width: 32.0,
              child: Icon(Icons.close,
                  color: widget.onTap != null
                      ? (widget.isActivated
                          ? theme.activeColor
                          : theme.defaultColor)
                      : theme.disabledColor),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    theme = widget.theme ?? UIKitChipTheme();
    return Container(
      child: InkWell(
        onTap: widget.onTap != null
            ? () {
                widget.onTap(!widget.isActivated);
              }
            : null,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: 32.0, minWidth: widget.label != null ? 100.0 : 32.0),
            child: DecoratedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _renderIcon(),
                  _renderLabel(),
                  _renderDivider(),
                  _renderClose()
                ],
              ),
              decoration: BoxDecoration(
                  color: widget.isActivated
                      ? (widget.onTap != null
                          ? theme.backgroundColor
                          : theme.disabledColor.withOpacity(0.2))
                      : Colors.transparent,
                  border: Border.all(
                      color: widget.onTap != null
                          ? (widget.isActivated
                              ? theme.activeColor
                              : theme.defaultColor)
                          : theme.disabledColor,
                      width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
            )),
      ),
    );
  }
}
