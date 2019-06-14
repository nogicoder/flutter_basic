import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'uikittabbartheme.dart';

class UIKitTab {
  final String label;

  UIKitTab({this.label});
}

class UIKitTabBar extends StatefulWidget implements PreferredSizeWidget {
  // final UIKitTabBarTheme theme;
  final int currentIndex;
  final List<UIKitTab> tabs;
  final void Function(int index) onTap;

  UIKitTabBar({Key key, this.currentIndex, this.tabs, this.onTap})
      : assert(
            tabs.length <= 3, 'Tabs bar must contains at maximum 3 tab items'),
        super(key: key);

  @override
  State<UIKitTabBar> createState() => UIKitTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(40.0);
}

class UIKitTabBarState extends State<UIKitTabBar> {
  int _tappingIndex;
  List<Widget> _tabs = [];
  final UIKitTabBarTheme theme = UIKitTabBarTheme();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabs = [];
    for (int i = 0; i < (widget.tabs ?? []).length; i++) {
      _tabs.add(
        _buildTab(i),
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.disabledColor, width: 1.0),
        ),
      ),
      child: Material(
        color: Colors.white,
        child: Row(
          children: _tabs,
        ),
      ),
    );
  }

  Widget _buildTab(int index) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        highlightColor: theme.activeColor,
        splashColor: theme.activeColor,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (TapDownDetails details) {
            setState(() {
              _tappingIndex = index;
            });
          },
          onTapUp: (TapUpDetails details) {
            setState(() {
              widget.onTap(index);
              _tappingIndex = null;
            });
          },
          onTapCancel: () {
            setState(() {
              widget.onTap(index);
              _tappingIndex = null;
            });
          },
          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              border: Border(
                  bottom: widget.currentIndex == index
                      ? BorderSide(color: theme.activeColor, width: 2.0)
                      : BorderSide.none),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: widget.currentIndex == index ? 0.0 : 2.0),
                child: Text(
                  widget.tabs[index].label,
                  style: TextStyle(
                    color: _tappingIndex != null && _tappingIndex == index
                        ? Colors.white
                        : (widget.currentIndex == index
                            ? theme.activeColor
                            : theme.defaultColor),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
