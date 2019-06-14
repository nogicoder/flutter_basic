import 'package:flutter/material.dart';
import 'uikitbannerroute.dart';
import 'dart:async';
import 'dart:ui';
import 'uikitbannertheme.dart';
import 'package:uikit_bycn/buttons/uikitbutton.dart';

const String BANNER_ROUTE_NAME = "/bannerRoute";
typedef void UIKitBannerStatusCallback(UIKitBannerStatus status);

enum UIKitBannerPosition { TOP, BOTTOM }
enum UIKitBannerStyle { FLOATING, GROUNDED }

enum UIKitBannerDismissDirection { HORIZONTAL, VERTICAL }

enum UIKitBannerStatus { SHOWING, DISMISSED, IS_APPEARING, IS_HIDING }

class UIKitBanner<T extends Object> extends StatefulWidget {
  UIKitBannerStatusCallback onStatusChanged;
  final UIKitBannerTheme theme = UIKitBannerTheme();
  final TextStyle messageStyle;
  final String message;
  final Widget body;
  final Duration duration;
  final bool isDismissible;
  final EdgeInsets aroundPadding;
  final BorderRadiusGeometry borderRadius;
  final UIKitBannerPosition bannerPosition;
  final UIKitBannerDismissDirection dismissDirection;
  final UIKitBannerStyle bannerStyle;
  final Curve forwardAnimationCurve;
  final Curve reverseAnimationCurve;
  final Duration animationDuration;
  final double overlayBlur;
  final Color overlayColor;

  final Function onPressedOK;
  final Function onPressCancel;

  UIKitBanner(
      {Key key,
      String message,
      TextStyle messageStyle,
      Widget body,
      EdgeInsets aroundPadding = const EdgeInsets.all(0.0),
      BorderRadiusGeometry borderRadius = BorderRadius.zero,
      Duration duration,
      bool isDismissible = true,
      UIKitBannerDismissDirection dismissDirection =
          UIKitBannerDismissDirection.VERTICAL,
      UIKitBannerPosition bannerPosition = UIKitBannerPosition.BOTTOM,
      UIKitBannerStyle bannerStyle = UIKitBannerStyle.FLOATING,
      Curve forwardAnimationCurve = Curves.easeOut,
      Curve reverseAnimationCurve = Curves.fastOutSlowIn,
      Duration animationDuration = const Duration(milliseconds: 300),
      UIKitBannerStatusCallback onStatusChanged,
      double overlayBlur = 0.0,
      Color overlayColor = Colors.transparent,
      Function onPressedOK,
      Function onPressedCancel})
      : this.messageStyle = messageStyle,
        this.message = message,
        this.body = body,
        this.aroundPadding = aroundPadding,
        this.borderRadius = borderRadius,
        this.duration = duration,
        this.isDismissible = isDismissible,
        this.dismissDirection = dismissDirection,
        this.bannerPosition = bannerPosition,
        this.bannerStyle = bannerStyle,
        this.forwardAnimationCurve = forwardAnimationCurve,
        this.reverseAnimationCurve = reverseAnimationCurve,
        this.animationDuration = animationDuration,
        this.overlayBlur = overlayBlur,
        this.overlayColor = overlayColor,
        this.onPressedOK = onPressedOK,
        this.onPressCancel = onPressedCancel,
        super(key: key) {
    this.onStatusChanged = onStatusChanged ?? (status) {};
  }
  UIKitBannerRoute<T> _bannerRoute;
  Future<T> show(BuildContext context) async {
    _bannerRoute = showBanner<T>(
      context: context,
      banner: this,
    );

    return await Navigator.of(context, rootNavigator: false).push(_bannerRoute);
  }

  /// Dismisses the flushbar causing is to return a future containing [result].
  /// When this future finishes, it is guaranteed that Flushbar was dismissed.
  Future<T> dismiss([T result]) async {
    // If route was never initialized, do nothing
    if (_bannerRoute == null) {
      return null;
    }

    if (_bannerRoute.isCurrent) {
      _bannerRoute.navigator.pop(result);
      return _bannerRoute.completed;
    } else if (_bannerRoute.isActive) {
      // removeRoute is called every time you dismiss a Flushbar that is not the top route.
      // It will not animate back and listeners will not detect FlushbarStatus.IS_HIDING or FlushbarStatus.DISMISSED
      // To avoid this, always make sure that Flushbar is the top route when it is being dismissed
      _bannerRoute.navigator.removeRoute(_bannerRoute);
    }

    return null;
  }

  /// Checks if the flushbar is visible
  bool isShowing() {
    return _bannerRoute?.currentStatus == UIKitBannerStatus.SHOWING;
  }

  /// Checks if the flushbar is dismissed
  bool isDismissed() {
    return _bannerRoute?.currentStatus == UIKitBannerStatus.DISMISSED;
  }

  @override
  State<UIKitBanner> createState() => UIKitBannerState<T>();
}

class UIKitBannerState<K extends Object> extends State<UIKitBanner>
    with TickerProviderStateMixin {
  UIKitBannerStatus currentStatus;

  AnimationController _fadeController;
  GlobalKey backgroundBoxKey = GlobalKey();

  FocusScopeNode focusNode = FocusScopeNode();

  @override
  void dispose() {
    _fadeController?.dispose();

    focusNode.detach();
    super.dispose();
  }

  UIKitBannerTheme get theme => widget.theme;

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: 1.0,
      child: Material(
        color: widget.bannerStyle == UIKitBannerStyle.FLOATING
            ? Colors.transparent
            : theme.backgroundColor,
        child: SafeArea(
          minimum: widget.bannerPosition == UIKitBannerPosition.BOTTOM
              ? EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom)
              : EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top),
          bottom: widget.bannerPosition == UIKitBannerPosition.BOTTOM,
          top: widget.bannerPosition == UIKitBannerPosition.TOP,
          left: false,
          right: false,
          child: DecoratedBox(
              key: backgroundBoxKey,
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: widget.borderRadius,
              ),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal:
                                widget.onPressCancel != null ? 10.0 : 0.0),
                        child: widget.body != null
                            ? widget.body
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: widget.onPressCancel != null
                                    ? MainAxisSize.max
                                    : MainAxisSize.min,
                                children: <Widget>[
                                    Text(widget.message,
                                        style: theme.messageStyle)
                                  ])),
                    widget.onPressedOK != null
                        ? Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                widget.onPressCancel != null
                                    ? UIKitButton(
                                        label: "Annuler",
                                        buttonType: UIKITBUTTONTYPE.TEXT,
                                        onPressed: () {
                                          widget.onPressCancel();
                                        })
                                    : Container(),
                                UIKitButton(
                                    label: "OK",
                                    buttonType: UIKITBUTTONTYPE.TEXT,
                                    onPressed: () {
                                      widget.onPressedOK();
                                    })
                              ],
                            ))
                        : Container(),
                    Container(
                      height: 1.0,
                      decoration: BoxDecoration(color: Color(0xFFC2C2C2)),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
