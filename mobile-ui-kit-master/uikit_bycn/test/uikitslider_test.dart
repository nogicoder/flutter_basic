import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/selection_control/uikitslider.dart';

class GenericTapTest {
  final TextDirection direction;
  final List<double> initialValues;
  final List<double> firstTapValues;
  final List<double> secondTapValues;

  GenericTapTest({
    this.direction,
    this.initialValues,
    this.firstTapValues,
    this.secondTapValues,
  });

  run(WidgetTester tester) async {
    List<double> values = initialValues;
    final Key sliderKey = UniqueKey();

    await tester.pumpWidget(
      Directionality(
        textDirection: direction,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MediaQuery(
              data: MediaQueryData.fromWindow(window),
              child: Material(
                child: Center(
                  child: UIKitSlider(
                    key: sliderKey,
                    values: values,
                    onChanged: (List<double> newValues) {
                      setState(() {
                        values = newValues;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
    Finder finder = find.byKey(sliderKey);
    expect(finder, findsOneWidget);
    expect(values, equals(initialValues));
    await tester.tap(finder);
    expect(values, equals(firstTapValues));
    await tester.pump();

    final Offset topLeft = tester.getTopLeft(finder);
    final Offset bottomRight = tester.getBottomRight(finder);
    final Offset target = topLeft + (bottomRight - topLeft) / 4.0;
    await tester.tapAt(target);
    expect(
      values,
      equals(
        secondTapValues.map((double value) => closeTo(value, 0.05)).toList(),
      ),
    );
    await tester.pump();
  }
}

class GenericDragTest {
  final TextDirection direction;
  final List<double> initialValues;
  final List<double> firstTapValues;
  final List<double> expectedValues;

  GenericDragTest({
    this.direction,
    this.initialValues,
    this.firstTapValues,
    this.expectedValues,
  });

  run(WidgetTester tester) async {
    List<double> values = initialValues;
    final Key sliderKey = UniqueKey();

    await tester.pumpWidget(
      Directionality(
        textDirection: direction,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MediaQuery(
              data: MediaQueryData.fromWindow(window),
              child: Material(
                child: Center(
                  child: UIKitSlider(
                    key: sliderKey,
                    values: values,
                    onChanged: (List<double> newValues) {
                      setState(() {
                        values = newValues;
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
    Finder finder = find.byKey(sliderKey);
    expect(finder, findsOneWidget);
    expect(values, equals(initialValues));
    await tester.tap(finder);
    expect(values, equals(firstTapValues));
    final Offset topLeft = tester.getTopLeft(finder);
    final Offset bottomRight = tester.getBottomRight(finder);
    final Offset target = topLeft + (bottomRight - topLeft) / 4.0;
    await tester.drag(finder, Offset(target.dx, 0.0));
    expect(
      values,
      equals(
        expectedValues.map((double value) => closeTo(value, 0.05)).toList(),
      ),
    );
    await tester.pump();
  }
}

runTapLeftToRightTest() {
  testWidgets(
      '[TAP] - Slider can move when tapped (LTR)',
      (WidgetTester tester) => GenericTapTest(
            direction: TextDirection.ltr,
            initialValues: [0],
            firstTapValues: [0.5],
            secondTapValues: [0.25],
          ).run(tester));
  testWidgets(
      '[TAP] 2 endpoints - Nearest thumb can move when tapped (LTR)',
      (WidgetTester tester) => GenericTapTest(
            direction: TextDirection.ltr,
            initialValues: [0, 1],
            firstTapValues: [0.5, 1],
            secondTapValues: [0.25, 1],
          ).run(tester));
}

runTapRightToLeftTest() {
  testWidgets(
      '[TAP] - Slider can move when tapped (RTL)',
      (WidgetTester tester) => GenericTapTest(
            direction: TextDirection.rtl,
            initialValues: [0],
            firstTapValues: [0.5],
            secondTapValues: [0.25],
          ).run(tester));
  testWidgets(
      '[TAP] 2 endpoints - Nearest thumb can move when tapped (RTL)',
      (WidgetTester tester) => GenericTapTest(
            direction: TextDirection.rtl,
            initialValues: [0, 1],
            firstTapValues: [0.5, 1],
            secondTapValues: [0.25, 1],
          ).run(tester));
}

runDragLeftToRightTest() {
  testWidgets(
      '[DRAG] - Slider can move when dragged (LTR)',
      (WidgetTester tester) => GenericDragTest(
            direction: TextDirection.ltr,
            initialValues: [0.0],
            firstTapValues: [0.5],
            expectedValues: [0.75],
          ).run(tester));
}

runDragRightToLeftTest() {
  testWidgets(
      '[DRAG] - Slider can move when dragged (RTL)',
      (WidgetTester tester) => GenericDragTest(
            direction: TextDirection.rtl,
            initialValues: [0.0],
            firstTapValues: [0.5],
            expectedValues: [0.75],
          ).run(tester));
}

void main() {
  runTapLeftToRightTest();
  runTapRightToLeftTest();
  runDragLeftToRightTest();
  runDragRightToLeftTest();
}
