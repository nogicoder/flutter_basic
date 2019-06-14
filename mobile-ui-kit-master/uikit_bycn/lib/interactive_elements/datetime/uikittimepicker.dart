import 'package:flutter/material.dart';
import 'dart:math';
import 'uikittimepickerroute.dart';
import 'package:uikit_bycn/buttons/uikitflatbutton.dart';
import 'package:uikit_bycn/uikittheme.dart';

const String TIMER_PICKER_ROUTE_NAME = "/timerRoute";
typedef void UIKitTimerPickerStatusCallback(UIKitTimerPickerStatus status);

enum UIKitTimerPickerStatus { SHOWING, DISMISSED, IS_APPEARING, IS_HIDING }

class UIKitTimePicker<T extends Object> extends StatefulWidget {
  UIKitTimerPickerStatusCallback onStatusChanged;
  final Duration duration;
  final bool isDismissible;
  final EdgeInsets aroundPadding;
  final BorderRadiusGeometry borderRadius;
  final Duration animationDuration;
  final Function(int hour, int minute) onPressedOK;
  final Function onPressedCancel;
  final int initHour;
  final int initMinute;

  UIKitTimePicker(
      {this.duration,
      this.animationDuration = const Duration(milliseconds: 200),
      this.isDismissible = true,
      this.aroundPadding = EdgeInsets.zero,
      this.borderRadius = BorderRadius.zero,
      this.onPressedOK,
      this.onPressedCancel,
      this.initHour = 0,
      this.initMinute = 0})
      : assert(0 <= initHour && initHour <= 23),
        assert(0 <= initMinute && initMinute <= 59) {
    this.onStatusChanged = onStatusChanged ?? (status) {};
  }

  UIKitTimePickerRoute<T> _timerPickerRoute;
  Future<T> show(BuildContext context) async {
    _timerPickerRoute = showUIKitTimerPicker<T>(
      context: context,
      timePicker: this,
    );

    return await Navigator.of(context, rootNavigator: false)
        .push(_timerPickerRoute);
  }

  Future<T> dismiss([T result]) async {
    // If route was never initialized, do nothing
    if (_timerPickerRoute == null) {
      return null;
    }

    if (_timerPickerRoute.isCurrent) {
      _timerPickerRoute.navigator.pop(result);
      return _timerPickerRoute.completed;
    } else if (_timerPickerRoute.isActive) {
      // removeRoute is called every time you dismiss a Flushbar that is not the top route.
      // It will not animate back and listeners will not detect FlushbarStatus.IS_HIDING or FlushbarStatus.DISMISSED
      // To avoid this, always make sure that Flushbar is the top route when it is being dismissed
      _timerPickerRoute.navigator.removeRoute(_timerPickerRoute);
    }

    return null;
  }

  /// Checks if the flushbar is visible
  bool isShowing() {
    return _timerPickerRoute?.currentStatus == UIKitTimerPickerStatus.SHOWING;
  }

  /// Checks if the flushbar is dismissed
  bool isDismissed() {
    return _timerPickerRoute?.currentStatus == UIKitTimerPickerStatus.DISMISSED;
  }

  @override
  State<UIKitTimePicker> createState() => UIKitTimePickerState();
}

class UIKitTimePickerState extends State<UIKitTimePicker> {
  AnimationController _fadeController;
  GlobalKey backgroundBoxKey = GlobalKey();

  FocusScopeNode focusNode = FocusScopeNode();

  @override
  void dispose() {
    _fadeController?.dispose();

    focusNode.detach();
    super.dispose();
  }

  int itemMultiple = 100;
  TextStyle fontStyle =
      TextStyle(color: Color(0xFF555554), fontWeight: FontWeight.normal);
  TextStyle selectedFontStyle =
      TextStyle(color: Color(0xFFE75113), fontWeight: FontWeight.bold);
  int selectedHour = 0;
  int selectedMinute = 0;

  List<Widget> get hourList {
    List<Widget> hourList = [];
    int hour = 0;

    for (var i = 0; i <= itemMultiple * 24; i++) {
      hourList.add(Container(
          alignment: Alignment.centerRight,
          height: 35.0,
          child: Text(
            hour >= 10 ? "$hour" : "0$hour",
            style: i == selectedHour ? selectedFontStyle : fontStyle,
          )));
      hour++;
      if (hour >= 24) hour = 0;
    }
    return hourList;
  }

  List<Widget> get minuteList {
    List<Widget> minuteList = [];
    int minute = 0;
    for (var i = 0; i <= itemMultiple * 60; i++) {
      minuteList.add(Container(
          alignment: Alignment.centerLeft,
          height: 35.0,
          child: Text(minute >= 10 ? "$minute" : "0$minute",
              style: i == selectedMinute ? selectedFontStyle : fontStyle)));
      minute++;
      if (minute >= 60) minute = 0;
    }
    return minuteList;
  }

  List<Widget> get indicators {
    List<Widget> indicators = [];
    for (var i = 0; i < 3; i++) {
      indicators.add(Container(
        height: 34.0,
        margin: EdgeInsets.only(bottom: 1.0),
        child: Center(
            child: Text(
          ":",
          style: i == 1 ? selectedFontStyle : fontStyle,
        )),
      ));
    }
    return indicators;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedHour = (itemMultiple / 2 * 24).floor() + widget.initHour;
    selectedMinute = (itemMultiple / 2 * 60).floor() + widget.initMinute;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x99000000),
        body: Center(
            child: Container(
                child: Center(
                    child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                    border:
                        Border.all(color: uiKitColors.separator, width: 2.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15.0),
                      width: 250.0,
                      child: Container(
                        child: Center(
                          child: Text(
                            "TIME PICKER",
                            style: fontStyle.copyWith(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250.0,
                      height: 105.0,
                      child: Container(
                          height: 105.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 35.0,
                                left: 35.0,
                                right: 35.0,
                                height: 2.0,
                                child: Container(
                                  height: 2.0,
                                  color: uiKitColors.separator,
                                ),
                              ),
                              Positioned(
                                top: 70.0,
                                left: 35.0,
                                right: 35.0,
                                height: 2.0,
                                child: Container(
                                  height: 2.0,
                                  color: uiKitColors.separator,
                                ),
                              ),
                              Positioned(
                                left: 0.0,
                                top: 0.0,
                                right: 0.0,
                                bottom: 0.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width: 70,
                                        height: 105,
                                        child: ListWheelScrollView(
                                          controller:
                                              FixedExtentScrollController(
                                                  initialItem:
                                                      this.selectedHour),
                                          itemExtent: 35.0,
                                          onSelectedItemChanged: (int index) {
                                            setState(() {
                                              selectedHour = index;
                                            });
                                          },
                                          physics: _ItemScrollPhysics(
                                              itemHeight: 35.0),
                                          children: this.hourList,
                                        )),
                                    Container(
                                        width: 20,
                                        height: 105,
                                        child: Column(
                                          children: this.indicators,
                                        )),
                                    Container(
                                        width: 70,
                                        height: 105,
                                        child: ListWheelScrollView(
                                          controller:
                                              FixedExtentScrollController(
                                                  initialItem: selectedMinute),
                                          itemExtent: 35.0,
                                          onSelectedItemChanged: (int index) {
                                            setState(() {
                                              selectedMinute = index;
                                            });
                                          },
                                          physics: _ItemScrollPhysics(
                                              itemHeight: 35.0),
                                          children: this.minuteList,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                        child: UIKitFlatButton(
                            label: "OK",
                            onPressed: () {
                              if (widget.onPressedOK != null)
                                widget.onPressedOK(
                                    (selectedHour % 24), (selectedMinute % 60));
                              Navigator.of(context).pop(true);
                            }))
                  ],
                )),
            Positioned(
              left: 218.0,
              top: -16.0,
              width: 50.0,
              height: 50.0,
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Image(
                    height: 30.0,
                    width: 30.0,
                    image: AssetImage("assets/images/close.png",
                        package: "uikit_bycn")),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            )
          ],
        )))));
  }
}

class _ItemScrollPhysics extends ScrollPhysics {
  /// Creates physics for snapping to item.
  /// Based on PageScrollPhysics
  final double itemHeight;
  final double targetPixelsLimit;

  const _ItemScrollPhysics({
    ScrollPhysics parent,
    this.itemHeight,
    this.targetPixelsLimit = 5.0,
  })  : assert(itemHeight != null && itemHeight > 0),
        super(parent: parent);

  @override
  _ItemScrollPhysics applyTo(ScrollPhysics ancestor) {
    return _ItemScrollPhysics(
        parent: buildParent(ancestor), itemHeight: itemHeight);
  }

  double _getItem(ScrollPosition position) {
    double maxScrollItem =
        (position.maxScrollExtent / itemHeight).floorToDouble();
    return min(max(0, position.pixels / itemHeight), maxScrollItem);
  }

  double _getPixels(ScrollPosition position, double item) {
    return item * itemHeight;
  }

  double _getTargetPixels(
      ScrollPosition position, Tolerance tolerance, double velocity) {
    double item = _getItem(position);
    if (velocity < -tolerance.velocity)
      item -= targetPixelsLimit;
    else if (velocity > tolerance.velocity) item += targetPixelsLimit;
    return _getPixels(position, item.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a item boundary.
//    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
//        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
//      return super.createBallisticSimulation(position, velocity);
    Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
