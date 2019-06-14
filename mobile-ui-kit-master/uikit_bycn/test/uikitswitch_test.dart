import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/selection_control/uikitswitch.dart';
import 'package:uikit_bycn/selection_control/uikitswitchtheme.dart';

class SwitchTest extends StatefulWidget {
  final String label;
  final bool enabled;
  final bool value;
  SwitchTest({
    this.label,
    this.enabled,
    this.value,
  });

  @override
  SwitchTestState createState() => new SwitchTestState();
}

class SwitchTestState extends State<SwitchTest> {
  bool value;
  UIKitSwitchTheme theme = UIKitSwitchTheme();

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return UIKitSwitch(
      label: widget.label,
      value: this.value,
      onChanged: widget.enabled != true
          ? null
          : (bool value) {
              setState(() {
                this.value = value;
              });
            },
    );
  }
}

class GenericChecboxTest {
  final SwitchTest testSuite;
  final SwitchTest expectedSuite;
  final String valueFailedReason;

  GenericChecboxTest({
    this.testSuite,
    this.expectedSuite,
    this.valueFailedReason,
  });

  run(WidgetTester tester) async {
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: testSuite,
              ),
            ),
          );
        },
      ),
    );
    Finder finder = find.descendant(
      of: find.byWidgetPredicate(
        (Widget widget) =>
            widget is UIKitSwitch && widget.label == testSuite.label,
      ),
      matching: find.byType(InkWell),
    );
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    SwitchTestState state = tester.state(find.byType(SwitchTest));
    expect(
      state.value,
      equals(expectedSuite.value),
      reason: valueFailedReason,
    );
  }
}

runTestToggleOnEnabledSwitch() {
  testWidgets(
      'Toggle on enabled checkbox',
      (WidgetTester tester) => GenericChecboxTest(
            testSuite:
                SwitchTest(label: 'Switch me on!', enabled: true, value: false),
            expectedSuite:
                SwitchTest(label: 'Switched on', enabled: true, value: true),
            valueFailedReason: 'Switch failed, value wasn\'t changed',
          ).run(tester));
}

runTestToggleOffEnabledSwitch() {
  testWidgets(
      'Toggle off enabled checkbox',
      (WidgetTester tester) => GenericChecboxTest(
            testSuite:
                SwitchTest(label: 'Switch me off!', enabled: true, value: true),
            expectedSuite:
                SwitchTest(label: 'Switched off', enabled: true, value: false),
            valueFailedReason: 'Switch failed, value wasn\'t changed',
          ).run(tester));
}

runTestToggleOnDisabledSwitch() {
  testWidgets(
      'Toggle on disabled checkbox',
      (WidgetTester tester) => GenericChecboxTest(
            testSuite: SwitchTest(
                label: 'Switch me on!', enabled: false, value: false),
            expectedSuite:
                SwitchTest(label: 'Not switched', enabled: false, value: false),
            valueFailedReason:
                'Disabled failed, value still changes when toggle',
          ).run(tester));
}

runTestToggleOffDisabledSwitch() {
  testWidgets(
      'Toggle off disabled checkbox',
      (WidgetTester tester) => GenericChecboxTest(
            testSuite: SwitchTest(
                label: 'Switch me off!', enabled: false, value: true),
            expectedSuite:
                SwitchTest(label: 'Not switched', enabled: false, value: true),
            valueFailedReason:
                'Disabled failed, value still changes when toggle',
          ).run(tester));
}

void main() {
  runTestToggleOnEnabledSwitch();
  runTestToggleOffEnabledSwitch();
  runTestToggleOnDisabledSwitch();
  runTestToggleOffDisabledSwitch();
}
