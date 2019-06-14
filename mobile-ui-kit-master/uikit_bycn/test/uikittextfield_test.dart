import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/text_fields/uikittextfield.dart';
import 'package:uikit_bycn/text_fields/uikittextfieldtheme.dart';

class TextFieldTest extends StatefulWidget {
  final String label;
  final String inputText;
  final bool enabled;
  final String value;
  final FocusNode focusNode;
  TextFieldTest({
    this.label,
    this.inputText,
    this.enabled,
    this.value,
    this.focusNode,
  });

  @override
  TextFieldTestState createState() => new TextFieldTestState();
}

class TextFieldTestState extends State<TextFieldTest> {
  String value;
  UIKitTextFieldTheme theme = UIKitTextFieldTheme();

  @override
  void initState() {
    super.initState();
    value = widget.value ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return UIKitTextField(
      label: widget.label,
      value: this.value,
      focusNode: widget.focusNode,
      onChanged: widget.enabled != true
          ? null
          : (String value) {
              setState(() {
                this.value = value;
              });
            },
    );
  }
}

class GenericChecboxTest {
  final FocusNode focusNode;
  final TextFieldTest testSuite;
  final TextFieldTest expectedSuite;
  final String valueFailedReason;

  GenericChecboxTest({
    this.focusNode,
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
    Finder finder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is UIKitTextField && widget.label == testSuite.label,
    );

    expect(finder, findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(tester.testTextInput.isVisible, isFalse);
    FocusScope.of(tester.element(find.byType(TextField)))
        .requestFocus(focusNode);
    await tester.idle();
    expect(tester.testTextInput.isVisible, isTrue);
    await tester.showKeyboard(find.byType(TextField));
    tester.testTextInput.enterText(testSuite.inputText);
    TextFieldTestState state = tester.state(find.byType(TextFieldTest));
    expect(
      state.value,
      equals(expectedSuite.value),
      reason: valueFailedReason,
    );
  }
}

runTypingInEnabledTextFieldTest() {
  testWidgets('Type in enabled text field', (WidgetTester tester) {
    final FocusNode focusNode = FocusNode();
    GenericChecboxTest(
      focusNode: focusNode,
      testSuite: TextFieldTest(
        label: 'Text',
        enabled: true,
        value: '',
        inputText: 'Hello world!',
        focusNode: focusNode,
      ),
      expectedSuite: TextFieldTest(
        label: 'Text',
        enabled: true,
        value: 'Hello world!',
      ),
      valueFailedReason: 'Typing failed, value wasn\'t changed',
    ).run(tester);
  });
}

runTypingInDisabledTextFieldTest() {
  testWidgets('Type in disabled text field', (WidgetTester tester) {
    final FocusNode focusNode = FocusNode();
    GenericChecboxTest(
      focusNode: focusNode,
      testSuite: TextFieldTest(
        label: 'Text',
        enabled: false,
        value: '',
        inputText: 'Hello world!',
        focusNode: focusNode,
      ),
      expectedSuite: TextFieldTest(
        label: 'Text',
        enabled: false,
        value: '',
      ),
      valueFailedReason: 'Disable failed, value changed',
    ).run(tester);
  });
}

void main() {
  runTypingInEnabledTextFieldTest();
  runTypingInDisabledTextFieldTest();
}
