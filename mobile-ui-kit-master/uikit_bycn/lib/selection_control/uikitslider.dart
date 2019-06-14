import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'uikitslidertheme.dart';

class UIKitSlider extends StatefulWidget {
  final double min;
  final double max;
  final List<double> values;
  final UIKitSliderTheme theme = UIKitSliderTheme();
  final void Function(List<double> values) onChanged;

  UIKitSlider(
      {Key key,
      @required this.values,
      this.min: 0.0,
      this.max: 1.0,
      this.onChanged})
      : assert(max > min),
        assert(values != null && values.length != 0),
        super(key: key);

  @override
  State<UIKitSlider> createState() => UIKitSliderState();
}

class UIKitSliderState extends State<UIKitSlider> {
  UIKitSliderTheme theme;

  double _unlerp(double value) {
    assert(value <= widget.max);
    assert(value >= widget.min);
    return widget.max > widget.min
        ? (value - widget.min) / (widget.max - widget.min)
        : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    theme = widget.theme;
    return _SliderRenderObjectWidget(
        values: (widget.values ?? [])
            .map((double value) => _unlerp(value))
            .toList(),
        theme: theme,
        onChanged: widget.onChanged,
        max: widget.max);
  }
}

class _SliderRenderObjectWidget extends LeafRenderObjectWidget {
  final List<double> values;
  final double max;
  final UIKitSliderTheme theme;
  final void Function(List<double> values) onChanged;
  const _SliderRenderObjectWidget(
      {Key key, this.values, this.max, this.theme, this.onChanged})
      : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSlider(
        values: values, max: max, theme: theme, onChanged: onChanged);
  }
}

class _RenderSlider extends RenderBox {
  _RenderSlider(
      {List<double> values,
      double max,
      UIKitSliderTheme theme,
      void Function(List<double> values) onChanged}) {
    _max = max;
    _values = values;
    _onChanged = onChanged;
    _theme = theme;
    _overlayDiameter = theme.thumbSize;
    _trackHeight = theme.trackHeight;
    _preferredTotalWidth = theme.sliderWidth;
    _thumbRadius = theme.thumbSize / 2;
    final GestureArenaTeam team = GestureArenaTeam();
    _drag = HorizontalDragGestureRecognizer()
      ..team = team
      ..onStart = _handleDragStart
      ..onEnd = _handleDragEnd
      ..onUpdate = _handleDragUpdate
      ..onCancel = _endInteraction;
    _tap = TapGestureRecognizer()
      ..team = team
      ..onTapDown = _handleTapDown
      ..onTapUp = _handleTapUp
      ..onTapCancel = _handleTapCancel;
  }

  double _overlayDiameter;
  double _trackHeight;
  double _preferredTotalWidth;
  double _thumbRadius;
  double _trackLength;
  double _trackVerticalCenter;
  double _trackLeft;
  double _trackTop;
  double _trackBottom;
  double _trackRight;
  double _max;
  List<double> _values;
  void Function(List<double> values) _onChanged;
  Map<int, Rect> _thumbRects;
  UIKitSliderTheme _theme;
  @override
  bool hitTestSelf(Offset position) => _onChanged != null;

  double _currentDragValue = 0.0;
  HorizontalDragGestureRecognizer _drag;
  TapGestureRecognizer _tap;

  @override
  bool get sizedByParent => true;

  @override
  void performResize() {
    size = Size(
      constraints.hasBoundedWidth ? constraints.maxWidth : _preferredTotalWidth,
      constraints.hasBoundedHeight ? constraints.maxHeight : _overlayDiameter,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    _paintTrack(canvas, offset);
    _paintSelected(canvas, offset);
    _paintThumbs(canvas, offset);
  }

  /// ------------------------------------------------------------------
  /// Computation of the min,max intrinsic
  /// width and height of the box.
  /// The following 4 methods must be implemented.
  ///
  /// computeMinIntrinsicWidth: minimal width.  Here as there are
  ///                           2 thumbs, enough space to display them
  /// computeMaxIntrinsicWidth: smallest width beyond which increasing
  ///                           the width never decreases the height
  /// computeMinIntrinsicHeight: minimal height.  Diameter of a thumb.
  /// computeMaxIntrinsicHeight: maximal height:  Diameter of a thumb.
  /// ------------------------------------------------------------------
  @override
  double computeMinIntrinsicWidth(double height) {
    return 2 * _overlayDiameter;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _preferredTotalWidth;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _overlayDiameter;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _overlayDiameter;
  }

  void _paintTrack(Canvas canvas, Offset offset) {
    final double trackRadius = _trackHeight / 2.0;
    _trackLength = size.width - 2 * _overlayDiameter;
    _trackVerticalCenter = offset.dy + (size.height) / 2.0;
    _trackLeft = offset.dx + _overlayDiameter;
    _trackTop = _trackVerticalCenter - trackRadius;
    _trackBottom = _trackVerticalCenter + trackRadius;
    _trackRight = _trackLeft + _trackLength;

    Rect _trackLeftRect =
        Rect.fromLTRB(_trackLeft, _trackTop, _trackRight, _trackBottom);
    Paint trackPaint = Paint()
      ..color =
          _onChanged != null ? _theme.inactiveColor : _theme.inactiveColorLight;
    canvas.drawRRect(
        RRect.fromRectAndRadius(_trackLeftRect, Radius.circular(trackRadius)),
        trackPaint);
  }

  void _paintTooltip(Canvas canvas, {String label, tooltipCenter}) {
    TextSpan span = TextSpan(
      style: TextStyle(color: Colors.white),
      text: label,
    );
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textTopLeft = Offset(
        tooltipCenter.dx - (tp.width / 2), tooltipCenter.dy - (tp.height / 2));
    RRect tooltipRect = RRect.fromRectAndRadius(
        Rect.fromLTRB(
            tooltipCenter.dx - (tp.width / 2) - _theme.tooltipPadding.left,
            tooltipCenter.dy - (tp.height / 2) - _theme.tooltipPadding.top,
            tooltipCenter.dx + (tp.width / 2) + _theme.tooltipPadding.right,
            tooltipCenter.dy + (tp.height / 2) + _theme.tooltipPadding.bottom),
        Radius.circular(_theme.tooltipRadidus));
    canvas.drawRRect(
        tooltipRect, Paint()..color = _theme.tooltipBackgrounColor);
    tp.paint(canvas, textTopLeft);
  }

  void _paintThumb(Canvas canvas, {Offset center, bool isActive}) {
    Offset shadowCenter = Offset(center.dx, center.dy);

    var shadowPath = new Path()
      ..addOval(Rect.fromCircle(center: shadowCenter, radius: _thumbRadius));
    canvas.drawShadow(shadowPath, Color(0xFF000000), 1.0, true);

    canvas.drawCircle(
        center,
        _thumbRadius,
        Paint()
          ..color = isActive ? _theme.activeColor : _theme.inactiveColorLight);

    if (isActive) {
      canvas.drawCircle(center, _thumbRadius - 4.0,
          Paint()..color = _theme.inactiveColorLight);
    }
  }

  void _paintThumbs(Canvas canvas, Offset offset) {
    _values.sort();
    _thumbRects = _values.asMap().map((int index, double value) {
      double thumbPosition = _trackLeft + value * _trackLength;
      Offset thumbCenter = Offset(thumbPosition, _trackVerticalCenter);
      Offset tooltipCenter = Offset(
          thumbPosition,
          _trackVerticalCenter +
              _thumbRadius +
              5.0 + // padding between thumb and tooltip
              _theme.tooltipPadding.top +
              _theme.tooltipHeight / 2);

      // Create an invisible zone to determine current active thumb
      Rect thumbRect = Rect.fromCircle(
          center: thumbCenter - offset, radius: _thumbRadius * 2.0);

      _paintThumb(canvas,
          center: thumbCenter, isActive: index == _activeThumbIndex);
      _paintTooltip(canvas,
          label: (value * _max).toStringAsFixed(2),
          tooltipCenter: tooltipCenter);
      return MapEntry(index, thumbRect);
    });
  }

  void _paintSelected(Canvas canvas, Offset offset) {
    if (_values.length == 0) {
      return;
    }
    double firstValuePosition = _trackLeft + _values.first * _trackLength;
    if (_values.length == 1) {
      Rect selectedTrackRect = Rect.fromLTRB(
          _trackLeft, _trackTop, firstValuePosition, _trackBottom);
      Paint trackPaint = Paint()
        ..color =
            _onChanged != null ? _theme.activeColor : _theme.inactiveColor;
      canvas.drawRect(selectedTrackRect, trackPaint);
      return;
    }
    double lastValuePosition = _trackLeft + _values.last * _trackLength;
    Rect selectedTrackRect = Rect.fromLTRB(
        firstValuePosition, _trackTop, lastValuePosition, _trackBottom);
    Paint trackPaint = Paint()
      ..color = _onChanged != null ? _theme.activeColor : _theme.inactiveColor;
    canvas.drawRect(selectedTrackRect, trackPaint);
    return;
  }

  double _getValueFromGlobalPosition(Offset globalPosition) {
    final double visualPosition =
        (globalToLocal(globalPosition).dx - _overlayDiameter) / _trackLength;

    return visualPosition;
  }

  void _handleDragStart(DragStartDetails details) =>
      _startInteraction(details.globalPosition);

  void _handleTapDown(TapDownDetails details) =>
      _startInteraction(details.globalPosition);

  void _handleTapUp(TapUpDetails details) {
    _activeThumbIndex = null;
  }

  void _handleDragEnd(DragEndDetails details) => _endDrag();

  void _handleTapCancel() {}

  void _startInteraction(Offset globalPosition) {
    _currentDragValue = _getValueFromGlobalPosition(globalPosition);
    double dragValue = _currentDragValue.clamp(0.0, 1.0);
    _onRangeChanged(dragValue);
  }

  void _endDrag() {
    _activeThumbIndex = null;
    _endInteraction();
  }

  void _endInteraction() {
    _currentDragValue = 0.0;
    markNeedsPaint();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final double valueDelta = details.primaryDelta / _trackLength;
    _currentDragValue += valueDelta;

    // we need to limit the movement to the track
    double dragValue = _currentDragValue.clamp(0.0, 1.0);
    _onRangeChanged(dragValue);
  }

  void _onRangeChanged(double value) {
    if (_activeThumbIndex != null) {
      _values[_activeThumbIndex] = value;
      _onChanged(_values.map((double value) => value * _max).toList());
      // Force a repaint
      markNeedsPaint();
    }
  }

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent) {
      _validateActiveThumb(entry.localPosition);

      // If a thumb is active, initiates the GestureDrag
      if (_activeThumbIndex != null) {
        _drag.addPointer(event);
        _tap.addPointer(event);
        // _handleDragStart(new DragStartDetails(globalPosition: event.position));
      }
    }
  }

  int _activeThumbIndex;

  _validateDragging(Offset position) {
    bool found = false;
    _thumbRects.forEach((int index, Rect thumbRect) {
      if (thumbRect.contains(position)) {
        _activeThumbIndex = index;
        found = true;
      }
    });
    return found;
  }

  _validateTapping(Offset position) {
    int thumbIndex = 0;
    double distance = 0;
    _thumbRects.forEach((int index, Rect thumbRect) {
      if (thumbRect.left < position.dx) {
        thumbIndex = index;
        distance = position.dx - (thumbRect.left + _overlayDiameter);
      } else if (index == thumbIndex + 1) {
        if (distance > (thumbRect.left + _overlayDiameter) - position.dx) {
          thumbIndex = index;
          distance = (thumbRect.left + _overlayDiameter) - position.dx;
        }
      }
    });
    _activeThumbIndex = thumbIndex;
  }

  _validateActiveThumb(Offset position) {
    bool found = _validateDragging(position);
    if (!found) {
      _validateTapping(position);
    }
  }
}
