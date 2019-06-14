import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'uikitheadertheme.dart';

class UIKitHeader extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget leading;
  final List<Widget> actions;
  final UIKitHeaderTheme theme = UIKitHeaderTheme();
  final PreferredSizeWidget bottom;

  UIKitHeader({Key key, this.title, this.leading, this.actions, this.bottom})
      : super(key: key);

  @override
  State<UIKitHeader> createState() => UIKitHeaderState();

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
}

class UIKitHeaderState extends State<UIKitHeader> {
  @override
  Widget build(BuildContext context) {
    UIKitHeaderTheme theme = widget.theme;
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Color(0x29000000), blurRadius: 3.0, spreadRadius: 4.0)
      ]),
      child: AppBar(
        elevation: 0.0,
        title: widget.title ?? Container(),
        leading: widget.leading ?? null,
        actions: widget.actions ?? null,
        bottom: widget.bottom ?? null,
        backgroundColor: theme.color,
        textTheme: theme.textTheme,
        iconTheme: theme.iconTheme,
        actionsIconTheme: theme.actionsIconTheme,
      ),
    );
  }
}
