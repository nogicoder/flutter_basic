import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/selection_control/uikitcheckbox.dart';
import 'package:uikit_bycn/selection_control/uikitcheckboxtheme.dart';

class CheckboxTest extends StatefulWidget {
  final String label;
  final bool enabled;
  final bool value;
  CheckboxTest({
    this.label,
    this.enabled,
    this.value,
  });

  @override
  CheckboxTestState createState() => new CheckboxTestState();
}

class CheckboxTestState extends State<CheckboxTest> {
  bool value;
  UIKitChecboxTheme theme = UIKitChecboxTheme();

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return UIKitCheckbox(
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
  final CheckboxTest testSuite;
  final CheckboxTest expectedSuite;
  final String valueFailedReason;

  GenericChecboxTest({
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
          widget is UIKitCheckbox && widget.label == testSuite.label,
    );
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    CheckboxTestState state = tester.state(
      find.byType(CheckboxTest),
    );

    expect(
      state.value,
      equals(expectedSuite.value),
      reason: valueFailedReason,
    );
  }
}

runTestCheckEnabledCheckbox() {
  testWidgets(
    'Check enabled checkbox',
    (WidgetTester tester) => GenericChecboxTest(
          testSuite: CheckboxTest(
            label: 'Check me!',
            enabled: true,
            value: false,
          ),
          expectedSuite: CheckboxTest(
            label: 'Checked',
            enabled: true,
            value: true,
          ),
          valueFailedReason: 'Check failed, value wasn\'t changed',
        ).run(tester),
  );
}

runTestUnCheckEnabledCheckbox() {
  testWidgets(
    'Un-check enabled checkbox',
    (WidgetTester tester) => GenericChecboxTest(
          testSuite: CheckboxTest(
            label: 'Un-check me!',
            enabled: true,
            value: true,
          ),
          expectedSuite: CheckboxTest(
            label: 'Un-checked',
            enabled: true,
            value: false,
          ),
          valueFailedReason: 'Un-check failed, value wasn\'t changed',
        ).run(tester),
  );
}

runTestCheckDisabledCheckbox() {
  testWidgets(
    'Check disabled checkbox',
    (WidgetTester tester) => GenericChecboxTest(
          testSuite: CheckboxTest(
            label: 'Check me!',
            enabled: false,
            value: false,
          ),
          expectedSuite: CheckboxTest(
            label: 'Not checked',
            enabled: false,
            value: false,
          ),
          valueFailedReason: 'Disabled failed, value still changes when check',
        ).run(tester),
  );
}

runTestUnCheckDisabledCheckbox() {
  testWidgets(
    'Un-check disabled checkbox',
    (WidgetTester tester) => GenericChecboxTest(
          testSuite: CheckboxTest(
            label: 'Un-check me!',
            enabled: false,
            value: false,
          ),
          expectedSuite: CheckboxTest(
            label: 'Not un-checked',
            enabled: false,
            value: false,
          ),
          valueFailedReason:
              'Disabled failed, value still changes when un-check',
        ).run(tester),
  );
}

void main() {
  runTestCheckEnabledCheckbox();
  runTestUnCheckEnabledCheckbox();
  runTestCheckDisabledCheckbox();
  runTestUnCheckDisabledCheckbox();
}
