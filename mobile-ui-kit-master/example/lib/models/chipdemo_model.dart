import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uikit_bycn/selection_control/uikitchiptheme.dart';
class ChipDemoModel {
  final int id = DateTime.now().microsecondsSinceEpoch;
  final IconData icon;
  final String label;
  final bool canClose;
  final UIKitChipTheme theme = UIKitChipTheme(activeColor: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0));

  ChipDemoModel({this.icon, this.label, this.canClose});
}