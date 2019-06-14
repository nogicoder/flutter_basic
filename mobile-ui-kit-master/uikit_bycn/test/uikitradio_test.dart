import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/selection_control/uikitradiobutton.dart';

class RadioTest extends StatefulWidget {
  @override
  State<RadioTest> createState() => _RadioTestState();
}

class _RadioTestState extends State<RadioTest> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UIKitRadioButton(
          label: "Radio1",
          value: 1,
          groupValue: this.value,
          onChanged: (value) {
            setState(() {
              this.value = 1;
            });
          },
        ),
        UIKitRadioButton(
          label: "Radio2",
          value: 2,
          groupValue: this.value,
          onChanged: (value) {
            setState(() {
              this.value = 2;
            });
          },
        ),
        UIKitRadioButton(
          label: "Radio3",
          value: 3,
          groupValue: this.value,
          onChanged: (value) {
            setState(() {
              this.value = 3;
            });
          },
        ),
        UIKitRadioButton(
          label: "Radio4",
          value: 4,
          groupValue: this.value,
        )
      ],
    );
  }
}

runtTestRadioButton() {
  testWidgets("test radio button", (WidgetTester tester) async {
    await tester.pumpWidget(
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return MaterialApp(
        home: Scaffold(
            body: Center(
          child: RadioTest(),
        )),
      );
    }));
    Finder finder = find.byWidgetPredicate(
      (Widget widget) => widget is UIKitRadioButton,
    );
    expect(finder, findsNWidgets(4));
    Finder radio1 = find.byWidgetPredicate(
      (Widget widget) => widget is UIKitRadioButton && widget.label == "Radio1",
    );
    Finder radio2 = find.byWidgetPredicate(
      (Widget widget) => widget is UIKitRadioButton && widget.label == "Radio2",
    );
    Finder radio3 = find.byWidgetPredicate(
      (Widget widget) => widget is UIKitRadioButton && widget.label == "Radio3",
    );
    Finder radio4 = find.byWidgetPredicate(
      (Widget widget) => widget is UIKitRadioButton && widget.label == "Radio4",
    );
    _RadioTestState state = tester.state(find.byType(RadioTest));
    print(state.value);
    expect(state.value, equals(1));
    await tester.tap(radio2);
    expect(state.value, equals(2));
    await tester.tap(radio3);
    expect(state.value, equals(3));
    await tester.tap(radio4);
    expect(state.value, equals(3));
    await tester.tap(radio1);
    expect(state.value, equals(1));
  });
}

void main() {
  runtTestRadioButton();
}
