import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'uikitbottomnavbartheme.dart';

class UIKitBottomNavigationItem {
  final String title;
  final IconData icon;
  final Widget body;
  final String routeName;

  UIKitBottomNavigationItem({this.title, this.icon, this.body, this.routeName});
}

class UIKitBottomNavigationBar extends StatefulWidget {
  final List<UIKitBottomNavigationItem> items;
  final int currentIndex;
  final void Function(int index) onTap;
  final UIKitBottomNavBarTheme theme = UIKitBottomNavBarTheme();

  UIKitBottomNavigationBar({
    this.items,
    this.currentIndex,
    this.onTap,
  })  : assert(items != null, 'children must not be null'),
        assert(items.length >= 3 && items.length <= 5,
            'Bottom nav bar must contains between 3-5 children');

  @override
  State<UIKitBottomNavigationBar> createState() =>
      new UIKitBottomNavigationBarState();
}

class UIKitBottomNavigationBarState extends State<UIKitBottomNavigationBar> {
  UIKitBottomNavBarTheme theme;
  List<Widget> pages;
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  initState() {
    pages = widget.items
        .map((item) => Container(
              key: PageStorageKey(item.title),
              child: item.body ?? Container(),
            ))
        .toList();
    super.initState();
  }

  List<BottomNavigationBarItem> _renderNavItems() {
    List<BottomNavigationBarItem> items = [];
    (widget.items ?? [])
        .asMap()
        .forEach((int index, UIKitBottomNavigationItem item) {
      items.add(
        BottomNavigationBarItem(
          title: Text(item.title ?? ''),
          icon: item.icon != null ? Icon(item.icon) : Container(),
        ),
      );
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    theme = widget.theme;
    return Container(
      child: Scaffold(
          body: PageStorage(
            child: pages[widget.currentIndex ?? 0],
            bucket: bucket,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(boxShadow: [theme.boxShadow]),
            child: BottomNavigationBar(
              items: _renderNavItems(),
              currentIndex: widget.currentIndex ?? 0,
              selectedItemColor: theme.activeColor,
              selectedFontSize: theme.fontSize,
              unselectedItemColor: theme.inactiveColor,
              unselectedFontSize: theme.fontSize,
              backgroundColor: theme.backgroundColor,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              onTap: widget.onTap,
            ),
          )),
    );
  }
}
