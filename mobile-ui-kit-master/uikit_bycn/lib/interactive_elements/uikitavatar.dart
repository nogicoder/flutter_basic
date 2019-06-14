import 'package:flutter/material.dart';
import 'dart:math';
import 'package:uikit_bycn/uikittheme.dart';

enum UIKitAvatarSize { SMALL, MEDIUM, LARGE }

// DEFAULT: for render a default avatar
// TITLE: using title as avatar
// SUBTITLE: using subTitle as avatar
enum UIKitAvatarStyle { DEFAULT, TITLE, SUBTITLE }

class UIKitAvatar extends StatefulWidget {
  final UIKitAvatarSize size;

  final String title;
  final String subTitle;
  final String titlePlaceHolder;
  final Function onPressed;
  final bool usingDefaultAvatar;
  final ImageProvider image;
  final UIKitAvatarStyle avatarStyle;

  UIKitAvatar(
      {this.size,
      this.title,
      this.subTitle,
      this.image,
      this.onPressed,
      this.titlePlaceHolder,
      this.avatarStyle = UIKitAvatarStyle.DEFAULT,
      this.usingDefaultAvatar = false});
  @override
  State<UIKitAvatar> createState() => UIKitAvatarState();
}

class UIKitAvatarState extends State<UIKitAvatar> {
  final TextStyle fontStyle = TextStyle(color: Color(0xFF555554));
  double get radius {
    switch (widget.size) {
      case UIKitAvatarSize.SMALL:
        return 32.0;
      case UIKitAvatarSize.MEDIUM:
        return 64.0;
      case UIKitAvatarSize.LARGE:
        return 128.0;
      default:
        return 32.0;
    }
  }

  double get defaultSize {
    switch (widget.size) {
      case UIKitAvatarSize.SMALL:
        return 8.0;
      case UIKitAvatarSize.MEDIUM:
        return 16.0;
      case UIKitAvatarSize.LARGE:
        return 32.0;
      default:
        return 16.0;
    }
  }

  Widget renderEmpty() {
    return widget.title == null &&
            widget.subTitle == null &&
            widget.image == null
        ? (!widget.usingDefaultAvatar
            ? (Stack(
                children: <Widget>[
                  Positioned(
                    left: 0.0,
                    top: 0.0,
                    height: radius,
                    width: radius,
                    child: CustomPaint(
                      size: Size(radius, radius),
                      foregroundPainter: _UIKitAvatarPainter(
                          completeColor: Color(0xFFE75113), width: 2.0),
                    ),
                  ),
                  Positioned(
                      height: radius,
                      width: radius,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.add,
                          size: radius,
                          color: Color(0xFFE75113),
                        ),
                        radius: radius,
                      ))
                ],
              ))
            : Container(
                decoration: BoxDecoration(
                  color: Color(0xFF019EE3),
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: Center(
                    child: Image(
                        height: defaultSize,
                        width: defaultSize,
                        image: AssetImage("assets/images/user.png",
                            package: "uikit_bycn"))),
              ))
        : Container();
  }

  Widget renderTitleContent() {
    return (widget.title != null || widget.subTitle != null)
        ? Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Column(
              children: <Widget>[
                widget.title != null
                    ? Text(
                        widget.title,
                        style: fontStyle,
                      )
                    : Container(),
                widget.subTitle != null
                    ? Text(widget.subTitle,
                        style: fontStyle.copyWith(color: uiKitColors.separator))
                    : Container()
              ],
            ),
          )
        : (widget.titlePlaceHolder != null
            ? Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(
                  widget.titlePlaceHolder,
                  style: TextStyle(color: Color(0xFFE75113)),
                ),
              )
            : Container());
  }

  Widget renderDefaultAvatar() {
    return widget.avatarStyle == UIKitAvatarStyle.DEFAULT &&
            widget.image == null &&
            (widget.title != null || widget.subTitle != null)
        ? Positioned(
            top: 0.0,
            left: 0.0,
            height: radius,
            width: radius,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF019EE3),
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Center(
                  child: Image(
                      height: defaultSize,
                      width: defaultSize,
                      image: AssetImage("assets/images/user.png",
                          package: "uikit_bycn"))),
            ))
        : Container();
  }

  Widget renderTextAvatar() {
    return widget.avatarStyle != UIKitAvatarStyle.DEFAULT &&
            widget.image == null &&
            (widget.title != null || widget.subTitle != null)
        ? Container(
            decoration: BoxDecoration(
                color: Color(0xFF00B7B5),
                borderRadius: BorderRadius.circular(radius)),
            child: Center(
                child: Text(
              widget.subTitle != null
                  ? widget.subTitle.substring(0, 3).toUpperCase()
                  : widget.title.substring(0, 3).toUpperCase(),
              style: TextStyle(color: Colors.white),
            )),
          )
        : Container();
  }

  Widget renderImage() {
    return widget.image != null
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: widget.image),
              borderRadius: BorderRadius.circular(radius),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: radius,
            height: radius,
            child: InkWell(
                borderRadius: BorderRadius.circular(radius),
                onTap: widget.onPressed,
                child: Stack(
                  children: <Widget>[
                    renderEmpty(),
                    renderDefaultAvatar(),
                    renderTextAvatar(),
                    renderImage()
                  ],
                ))),
        renderTitleContent()
      ],
    );
  }
}

class _UIKitAvatarPainter extends CustomPainter {
  Color completeColor;
  double width;
  _UIKitAvatarPainter({this.completeColor, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    var percent = (size.width * 0.001) / 2;

    double arcAngle = 16 / size.width;
    print("$percent - percent");
    print("$radius - radius");
    print("$arcAngle - arcAngle");
    print("${radius / arcAngle} - divider");
    for (var i = 0; i < size.width / 4; i++) {
      var init = (-pi / 2) * (i * arcAngle);

      canvas.drawArc(new Rect.fromCircle(center: center, radius: radius), init,
          arcAngle, false, complete);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
