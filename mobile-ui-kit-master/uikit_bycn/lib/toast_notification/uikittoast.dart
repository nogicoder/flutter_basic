import 'package:flutter/material.dart';
class UIKitToastPosition {
  final Alignment alignment;

  const UIKitToastPosition({this.alignment = Alignment.topCenter});

  static const top = const UIKitToastPosition(
    alignment: Alignment.topCenter,
  );

  static const bottom = const UIKitToastPosition(
    alignment: Alignment.bottomCenter,
  );
}

class UIKitToastType {
  final Color borderColor;
  final Color backgroundColor;
  final String iconUrl;
  const UIKitToastType({
    this.borderColor = const Color(0xFF94C62A),
    this.backgroundColor = const Color(0xFFEFF6DF),
    this.iconUrl = 'assets/images/check.png',
  });

  static const success = const UIKitToastType(
    borderColor: const Color(0xFF94C62A),
    backgroundColor: const Color(0xFFEFF6DF),
    iconUrl: 'assets/images/check.png',
  );
  static const error = const UIKitToastType(
    borderColor: const Color(0xFFD60D0D),
    backgroundColor: const Color(0xFFF9DBDB),
    iconUrl: 'assets/images/cancel.png',
  );
}

class UIKitToast extends StatelessWidget {
  final String message;
  final UIKitToastType type;
  final UIKitToastPosition position;
  UIKitToast({
    this.message,
    this.type = UIKitToastType.success,
    this.position = UIKitToastPosition.top,
  });

  showToast({
    @required BuildContext context,
    Duration duration,
  }) {
    assert(debugCheckHasMaterialLocalizations(context));
    OverlayEntry entry = OverlayEntry(builder: (context) => this);
    Overlay.of(context).insert(entry);
    Future.delayed(duration, () {
      entry.remove();
    });
  }

  Widget _renderIcon() {
    return Container(
      height: 30.0,
      width: 30.0,
      child: Image.asset(type.iconUrl, package: 'uikit_bycn')
    );
  }

  Widget _renderLabel(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Text(
        message,
        style: TextStyle(
          fontFamily: Theme.of(context).textTheme.button.fontFamily,
          fontSize: Theme.of(context).textTheme.button.fontSize,
          fontWeight: Theme.of(context).textTheme.button.fontWeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Align(
      alignment: position.alignment,
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40.0,
                  margin: EdgeInsets.all(20.0),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _renderIcon(),
                        _renderLabel(context),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: type.borderColor),
                    color: type.backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
