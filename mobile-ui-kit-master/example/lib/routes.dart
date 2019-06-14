import 'package:flutter/material.dart';
import 'package:uikit_bycn_example/pages/button_demo_page.dart';
import 'package:uikit_bycn_example/pages/selection_control_demo_page.dart';
import 'package:uikit_bycn_example/pages/slider_demo_page.dart';
import 'package:uikit_bycn_example/pages/chip_demo_page.dart';
import 'package:uikit_bycn_example/pages/interactive_element_demo_page.dart';
import 'package:uikit_bycn_example/pages/text_field_demo_page.dart';
import 'package:uikit_bycn_example/pages/bottom_nav_bar_demo_page.dart';
import 'package:uikit_bycn_example/pages/header_demo_page.dart';
import 'package:uikit_bycn_example/pages/tab_bar_demo_page.dart';
import 'package:uikit_bycn_example/pages/datetime_demo_page.dart';
import 'package:uikit_bycn_example/pages/card_demo_page.dart';
import 'package:uikit_bycn_example/pages/toast_notification_demo_page.dart';

class RouteName {
  static const BUTTON_ROUTE = "button";
  static const SELECTION_CONTROL_ROUTE = "selection_control";
  static const SLIDER = "slider";
  static const CHIP = "chip";
  static const INTERACTIVE_ELEMENT = "interactive_element";
  static const TEXT_FIELD = "text_field";
  static const BOTTOM_NAV = "bottom_nav";
  static const HEADER = "header";
  static const TAB_BAR = "tab_bar";
  static const DATE_TIME = "datetime";
  static const CARD = "card";
  static const TOAST = "toast";
}

Map<String, WidgetBuilder> routes = {
  RouteName.BUTTON_ROUTE: (BuildContext context) => ButtonDemoPage(),
  RouteName.SELECTION_CONTROL_ROUTE: (BuildContext context) =>
      SelectionControlDemoPage(),
  RouteName.SLIDER: (BuildContext context) => SliderDemoPage(),
  RouteName.CHIP: (BuildContext context) => ChipDemoPage(),
  RouteName.INTERACTIVE_ELEMENT: (BuildContext context) =>
      InteractiveElementDemoPage(),
  RouteName.TEXT_FIELD: (BuildContext context) => TextFieldDemoPage(),
  RouteName.BOTTOM_NAV: (BuildContext context) => BottomNavBarDemoPage(),
  RouteName.HEADER: (BuildContext context) => HeaderDemoPage(),
  RouteName.TAB_BAR: (BuildContext context) => TabBarDemoPage(),
  RouteName.DATE_TIME: (BuildContext context) => DateTimeDemoPage(),
  RouteName.CARD: (BuildContext context) => CardDemoPage(),
  RouteName.TOAST: (BuildContext context) => ToastDemoPage(),
};
