import 'package:flutter/material.dart';

enum UIKitLinearStrokeCap { butt, round, roundAll }

class UIKitLoadingLinear extends StatefulWidget {
  ///Percent value between 0.0 and 1.0
  final double percent;
  final double width;
  final bool isError;

  ///Height of the line
  final double lineHeight;

  ///Color of the background of the Line , default = transparent
  final Color fillColor;

  ///First color applied to the complete line
  final Color backgroundColor;

  final Color progressColor;

  ///true if you want the Line to have animation
  final bool animation;

  ///duration of the animation in milliseconds, It only applies if animation attribute is true
  final int animationDuration;

  ///widget inside the Line
  final String percentText;

  ///The kind of finish to place on the end of lines drawn, values supported: butt, round, roundAll
  final UIKitLinearStrokeCap linearStrokeCap;

  ///alignment of the Row (leading-widget-center-trailing)
  final MainAxisAlignment alignment;

  /// set true if you want to animate the linear from the last percent value you set
  final bool animateFromLastPercent;

  /// If present, this will make the progress bar colored by this gradient.
  ///
  /// This will override [progressColor]. It is an error to provide both.
  final LinearGradient linearGradient;

  /// set false if you don't want to preserve the state of the widget
  final bool addAutomaticKeepAlive;

  /// set true if you want to animate the linear from the right to left (RTL)
  final bool isRTL;

  UIKitLoadingLinear(
      {Key key,
      this.fillColor = Colors.transparent,
      this.isError = false,
      this.percent = 0.0,
      this.lineHeight = 4.0,
      this.width,
      this.backgroundColor = const Color(0xFFB2E9E9),
      this.linearGradient,
      this.progressColor = const Color(0xFF00A3A5),
      this.animation = false,
      this.animationDuration = 500,
      this.animateFromLastPercent = false,
      this.isRTL = false,
      this.percentText,
      this.addAutomaticKeepAlive = true,
      this.linearStrokeCap,
      this.alignment = MainAxisAlignment.start})
      : super(key: key) {
    if (linearGradient != null && progressColor != null) {
      throw ArgumentError(
          'Cannot provide both linearGradient and progressColor');
    }

    if (percent < 0.0 || percent > 1.0) {
      throw new Exception("Percent value must be a double between 0.0 and 1.0");
    }
  }

  @override
  _UIKitLoadingLinearState createState() => _UIKitLoadingLinearState();
}

class _UIKitLoadingLinearState extends State<UIKitLoadingLinear>
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
      _animationController = new AnimationController(
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
  void didUpdateWidget(UIKitLoadingLinear oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent) {
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

    final hasSetWidth = widget.width != null;
    var containerWidget = Container(
        child: Column(
      children: <Widget>[
        widget.percentText != null
            ? Text(
                widget.percentText,
                style: TextStyle(
                    color: widget.isError
                        ? Color(0xFFD60B0B)
                        : widget.progressColor),
              )
            : Container(),
        Container(
          width: hasSetWidth ? widget.width : double.infinity,
          height: widget.lineHeight * 2,
          child: CustomPaint(
            painter: LinearPainter(
                isRTL: widget.isRTL,
                progress: _percent,
                progressColor:
                    widget.isError ? Color(0xFFD60B0B) : widget.progressColor,
                linearGradient: widget.linearGradient,
                backgroundColor:
                    widget.isError ? Color(0xFFF3B5b5) : widget.backgroundColor,
                linearStrokeCap: widget.linearStrokeCap,
                lineWidth: widget.lineHeight),
          ),
        )
      ],
    ));

    if (hasSetWidth) {
      items.add(containerWidget);
    } else {
      items.add(Expanded(
        child: containerWidget,
      ));
    }

    return Material(
      color: Colors.transparent,
      child: new Container(
          color: widget.fillColor,
          child: Row(
            mainAxisAlignment: widget.alignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: items,
          )),
    );
  }
}

class LinearPainter extends CustomPainter {
  final Paint _paintBackground = new Paint();
  final Paint _paintLine = new Paint();
  final lineWidth;
  final progress;
  final isRTL;
  final Color progressColor;
  final Color backgroundColor;
  final UIKitLinearStrokeCap linearStrokeCap;
  final LinearGradient linearGradient;

  LinearPainter(
      {this.lineWidth,
      this.progress,
      this.isRTL,
      this.progressColor,
      this.backgroundColor,
      this.linearStrokeCap = UIKitLinearStrokeCap.round,
      this.linearGradient}) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = lineWidth;

    _paintLine.color = progress.toString() == "0.0"
        ? progressColor.withOpacity(0.0)
        : progressColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = lineWidth;

    _paintLine.strokeCap = StrokeCap.butt;
    _paintBackground.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(0.0, size.height / 2);
    final end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, _paintBackground);
    Paint startPoint = Paint()
      ..color = _paintLine.color
      ..style = _paintLine.style
      ..strokeWidth = _paintLine.strokeWidth
      ..strokeCap = StrokeCap.round;
    if (isRTL) {
      final xProgress = size.width - size.width * progress;
      if (linearGradient != null) {
        _paintLine.shader = linearGradient.createShader(Rect.fromPoints(
            Offset(size.width, size.height), Offset(xProgress, size.height)));
      }

      canvas.drawLine(end, end, startPoint);
      if (xProgress == 0) canvas.drawLine(start, start, startPoint);

      canvas.drawLine(end, Offset(xProgress, size.height / 2), _paintLine);
    } else {
      final xProgress = size.width * progress;
      if (linearGradient != null) {
        _paintLine.shader = linearGradient.createShader(
            Rect.fromPoints(Offset.zero, Offset(xProgress, size.height)));
      }

      canvas.drawLine(start, start, startPoint);
      if (xProgress == size.width) canvas.drawLine(end, end, startPoint);
      canvas.drawLine(start, Offset(xProgress, size.height / 2), _paintLine);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
