import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

enum UIKitCircularStrokeCap { butt, round, square }

class UIKitLoadingCircular extends StatefulWidget {
  ///Percent value between 0.0 and 1.0
  final double percent;
  final double radius;

  final bool isError;

  ///Width of the line of the Circle
  final double lineWidth;

  ///Color of the background of the circle , default = transparent
  final Color fillColor;

  ///First color applied to the complete circle
  final Color backgroundColor;
  final Color progressColor;

  ///true if you want the circle to have animation
  final bool animation;

  ///duration of the animation in milliseconds, It only applies if animation attribute is true
  final int animationDuration;

  ///widget inside the circle
  final String percentText;

  final String detail;

  ///The kind of finish to place on the end of lines drawn, values supported: butt, round, square
  final UIKitCircularStrokeCap circularStrokeCap;

  ///the angle which the circle will start the progress (in degrees, eg: 0.0, 45.0, 90.0)
  final double startAngle;

  /// set true if you want to animate the linear from the last percent value you set
  final bool animateFromLastPercent;

  /// set false if you don't want to preserve the state of the widget
  final bool addAutomaticKeepAlive;

  UIKitLoadingCircular({
    Key key,
    this.isError = false,
    this.percent = 0.0,
    this.lineWidth = 5.0,
    this.startAngle = 0.0,
    this.radius = 150.0,
    this.fillColor = Colors.transparent,
    this.backgroundColor = const Color(0xFFB2E9E9),
    this.progressColor = const Color(0xFF00A3A5),
    this.animation = false,
    this.animationDuration = 500,
    this.percentText,
    this.detail,
    this.addAutomaticKeepAlive = true,
    this.circularStrokeCap,
    this.animateFromLastPercent = false,
  }) : super(key: key) {
    assert(startAngle >= 0.0);
    if (percent < 0.0 || percent > 1.0) {
      throw Exception("Percent value must be a double between 0.0 and 1.0");
    }
  }

  @override
  _UIKitLoadingCircularState createState() => _UIKitLoadingCircularState();
}

class _UIKitLoadingCircularState extends State<UIKitLoadingCircular>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  double _percent = 0.0;

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    if (widget.animation) {
      _animationController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration));
      _animation =
          Tween(begin: 0.0, end: widget.percent).animate(_animationController)
            ..addListener(() {
              setState(() {
                _percent = _animation.value;
              });
            });
      _animationController.forward();
    } else {
      _updateProgress();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(UIKitLoadingCircular oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent ||
        oldWidget.startAngle != widget.startAngle) {
      if (_animationController != null) {
        _animationController.duration =
            Duration(milliseconds: widget.animationDuration);
        _animation = Tween(
                begin: widget.animateFromLastPercent ? oldWidget.percent : 0.0,
                end: widget.percent)
            .animate(_animationController);
        _animationController.forward(from: 0.0);
      } else {
        _updateProgress();
      }
    }
  }

  _updateProgress() {
    setState(() {
      _percent = widget.percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = List<Widget>();

    items.add(Container(
      height: widget.radius + widget.lineWidth,
      width: widget.radius,
      child: CustomPaint(
        painter: CirclePainter(
            progress: _percent * 360,
            progressColor:
                widget.isError ? Color(0xFFD60B0B) : widget.progressColor,
            backgroundColor:
                widget.isError ? Color(0xFFF3B5b5) : widget.backgroundColor,
            startAngle: widget.startAngle,
            circularStrokeCap: widget.circularStrokeCap,
            radius: (widget.radius / 2) - widget.lineWidth,
            lineWidth: widget.lineWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (widget.percentText != null)
                ? Center(
                    child: Text(
                    widget.percentText,
                    style: TextStyle(
                        color: widget.isError
                            ? Color(0xFFD60B0B)
                            : widget.progressColor),
                  ))
                : Container(),
            (widget.detail != null)
                ? Text(
                    widget.detail,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9C9C9C)),
                  )
                : Container()
          ],
        ),
      ),
    ));

    return Material(
      color: widget.fillColor,
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: items,
      )),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final lineWidth;
  final progress;
  final radius;
  final Color progressColor;
  final Color backgroundColor;
  final UIKitCircularStrokeCap circularStrokeCap;
  final double startAngle;

  CirclePainter(
      {this.lineWidth,
      this.progress,
      @required this.radius,
      this.progressColor,
      this.backgroundColor,
      this.startAngle = 0.0,
      this.circularStrokeCap = UIKitCircularStrokeCap.round}) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = lineWidth;

    _paintLine.color = progressColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = lineWidth;
    _paintLine.strokeCap = StrokeCap.square;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, _paintBackground);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.radians(-90.0 + startAngle),
        math.radians(progress),
        false,
        _paintLine);
    Paint paint = Paint();
    paint.color = Color.fromARGB(178, 255, 255, 255);
    canvas.drawOval(
        Rect.fromCircle(
            center: Offset(size.width / 2 + 1, lineWidth * 1.5),
            radius: lineWidth * 0.4),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
