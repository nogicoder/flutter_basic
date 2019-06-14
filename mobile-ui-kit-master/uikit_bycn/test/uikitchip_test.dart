import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/selection_control/uikitchip.dart';
import 'package:uikit_bycn/selection_control/uikitchiptheme.dart';

class ChipTest extends StatefulWidget {
  final String label;
  final bool enabled;
  final bool value;
  final bool canClose;
  final bool closed;
  ChipTest({
    this.label,
    this.enabled,
    this.value,
    this.canClose,
    this.closed
  });

  @override
  ChipTestState createState() => new ChipTestState();
}

class ChipTestState extends State<ChipTest> {
  bool value;
  bool closed;
  UIKitChipTheme theme = UIKitChipTheme();

  @override
  void initState() {
    super.initState();
    value = widget.value;
    closed = widget.closed;
  }

  @override
  Widget build(BuildContext context) {
    return UIKitChip(
      canClose: widget.canClose,
      label: widget.label,
      isActivated: this.value,
      theme: this.theme,
      onClose: widget.enabled != true
          ? null
          : () {
              setState(() {
                this.closed = true;
              });
            },
      onTap: widget.enabled != true
          ? null
          : (bool value) {
              setState(() {
                this.value = value;
              });
            },
    );
  }
}

class ChipToggleTest {
  final ChipTest testSuite;
  final ChipTest expectedSuite;
  final String valueFailedReason;

  ChipToggleTest({
    this.testSuite,
    this.expectedSuite,
    this.valueFailedReason,
  });

  run(WidgetTester tester) async {
    await tester.pumpWidget(
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: testSuite,
            ),
          ),
        );
      }),
    );
    Finder finder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is UIKitChip && widget.label == testSuite.label,
    );
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    ChipTestState state = tester.state(
      find.byType(ChipTest),
    );

    expect(
      state.value,
      equals(expectedSuite.value),
      reason: valueFailedReason,
    );
  }
}

class ChipCloseTest {
  final ChipTest testSuite;
  final ChipTest expectedSuite;
  final String valueFailedReason;

  ChipCloseTest({
    this.testSuite,
    this.expectedSuite,
    this.valueFailedReason,
  });

  run(WidgetTester tester) async {
    await tester.pumpWidget(
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: testSuite,
            ),
          ),
        );
      }),
    );
    Finder finder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is UIKitChip && widget.label == testSuite.label,
    );
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    ChipTestState state = tester.state(
      find.byType(ChipTest),
    );

    expect(
      state.closed,
      equals(expectedSuite.closed),
      reason: valueFailedReason,
    );
  }
}

runTestToggleOnEnabledChip() {
  testWidgets(
    'Toggle on enabled chip',
    (WidgetTester tester) => ChipToggleTest(
          testSuite: ChipTest(
            label: 'Switch me on!',
            canClose: false,
            enabled: true,
            value: false,
          ),
          expectedSuite: ChipTest(
            label: 'Switched on',
            canClose: false,
            enabled: true,
            value: true,
          ),
          valueFailedReason: 'Switch failed, value wasn\'t changed',
        ).run(tester),
  );
}

runTestToggleOffEnabledChip() {
  testWidgets(
    'Toggle off enabled chip',
    (WidgetTester tester) => ChipToggleTest(
          testSuite: ChipTest(
            label: 'Switch me off!',
            canClose: false,
            enabled: true,
            value: true,
          ),
          expectedSuite: ChipTest(
            label: 'Switched off',
            canClose: false,
            enabled: true,
            value: false,
          ),
          valueFailedReason: 'Switch failed, value wasn\'t changed',
        ).run(tester),
  );
}

runTestToggleOnDisabledChip() {
  testWidgets(
    'Toggle on disabled chip',
    (WidgetTester tester) => ChipToggleTest(
          testSuite: ChipTest(
            label: 'Switch me on!',
            canClose: false,
            enabled: false,
            value: false,
          ),
          expectedSuite: ChipTest(
            label: 'Not switched',
            canClose: false,
            enabled: false,
            value: false,
          ),
          valueFailedReason: 'Disabled failed, value still changes when toggle',
        ).run(tester),
  );
}

runTestToggleOffDisabledChip() {
  testWidgets(
    'Un-check disabled chip',
    (WidgetTester tester) => ChipToggleTest(
          testSuite: ChipTest(
            label: 'Switch me off!',
            canClose: false,
            enabled: false,
            value: false,
          ),
          expectedSuite: ChipTest(
            label: 'Not switched',
            canClose: false,
            enabled: false,
            value: false,
          ),
          valueFailedReason:
              'Disabled failed, value still changes when toggle',
        ).run(tester),
  );
}

runTestCloseEnabledChip() {
  testWidgets(
    'Close enabled chip',
    (WidgetTester tester) => ChipCloseTest(
          testSuite: ChipTest(
            canClose: true,
            enabled: true,
            value: false,
            closed: false,
          ),
          expectedSuite: ChipTest(
            canClose: true,
            enabled: true,
            value: false,
            closed: true,
          ),
          valueFailedReason:
              'Closed failed, value wasn\'t changed',
        ).run(tester),
  );
}

runTestCloseDisabledChip() {
  testWidgets(
    'Close disabled chip',
    (WidgetTester tester) => ChipCloseTest(
          testSuite: ChipTest(
            canClose: true,
            enabled: false,
            value: false,
            closed: false,
          ),
          expectedSuite: ChipTest(
            canClose: true,
            enabled: false,
            value: false,
            closed: false,
          ),
          valueFailedReason:
              'Disabled failed, value still changes when toggle',
        ).run(tester),
  );
}

void main() {
  runTestToggleOnEnabledChip();
  runTestToggleOffEnabledChip();
  runTestToggleOnDisabledChip();
  runTestToggleOffDisabledChip();
  runTestCloseEnabledChip();
  runTestCloseDisabledChip();
}
