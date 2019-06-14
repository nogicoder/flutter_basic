import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/buttons/uikitflatbutton.dart';
import 'package:uikit_bycn/buttons/uikitoutlinebutton.dart';
import 'package:uikit_bycn/buttons/uikittextbutton.dart';
import 'package:uikit_bycn/buttons/uikittogglebutton.dart';
import 'package:uikit_bycn/buttons/uikithubbutton.dart';
import 'package:flutter/material.dart';
import 'dart:math';

Color getRandomColor() {
  Random random = new Random();
  return Color.fromARGB(
      255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
}

double getRandomSize() {
  Random random = new Random();
  return random.nextDouble() * 100;
}

const ASCII_START = 33;
const ASCII_END = 126;

/// Defaults to characters of ascii '!' to '~'.
String getRandomString(int length, {int from: ASCII_START, int to: ASCII_END}) {
  return new String.fromCharCodes(new List.generate(
      length, (index) => (from + new Random().nextInt((to - from)))));
}

class FlatButtonTest extends StatefulWidget {
  final String label;
  final String afterPressedLabel;
  final Function onPressed;
  FlatButtonTest({this.label, this.afterPressedLabel, this.onPressed});

  @override
  FlatButtonTestState createState() => new FlatButtonTestState();
}

class FlatButtonTestState extends State<FlatButtonTest> {
  String label = "Flat Demo";
  @override
  Widget build(BuildContext context) {
    return UIKitFlatButton(
        leftIcon: Icons.home,
        rightIcon: Icons.transform,
        label: label,
        onPressed: () {
          setState(() {
            label = "Flat Clicked";
          });
        });
  }
}

class OutlineButtonTest extends StatefulWidget {
  @override
  OutlineButtonTestState createState() => OutlineButtonTestState();
}

class OutlineButtonTestState extends State<OutlineButtonTest> {
  String label = "Outline Demo";
  @override
  Widget build(BuildContext context) {
    return UIKitOutlineButton(
        label: label,
        leftIcon: Icons.error,
        rightIcon: Icons.print,
        onPressed: () {
          setState(() {
            label = "Outline Clicked";
          });
        });
  }
}

class TextButtonTest extends StatefulWidget {
  @override
  TextButtonTestState createState() => TextButtonTestState();
}

class TextButtonTestState extends State<TextButtonTest> {
  String label = "Text Demo";
  @override
  Widget build(BuildContext context) {
    return UIKitTextButton(
        label: label,
        onPressed: () {
          setState(() {
            label = "Text Clicked";
          });
        });
  }
}

class ToggleButtonTest extends StatefulWidget {
  @override
  ToggleButtonTestState createState() => ToggleButtonTestState();
}

class ToggleButtonTestState extends State<ToggleButtonTest> {
  String label = "Toggle Demo";
  String status = "Active";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        UIKitToggleButton(
            label: label,
            leftIcon: Icons.timer,
            rightIcon: Icons.near_me,
            onStateChanged: (status) {
              setState(() {
                if (this.status == "Active")
                  this.status = "Deactive";
                else
                  this.status = "Active";
              });
            },
            onPressed: () {
              setState(() {
                label = "Toggle Deactived";
              });
            }),
        Text(status)
      ],
    );
  }
}

class HubButtonTest extends StatefulWidget {
  @override
  HubButtonTestState createState() => HubButtonTestState();
}

class HubButtonTestState extends State<HubButtonTest> {
  String label = "Hub Demo";
  String status = "Active";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        UIKitHubButton(
            label: label,
            onPressed: () {
              setState(() {
                label = "Hub Deactived";
                status = "Deactive";
              });
            }),
        Text(status)
      ],
    );
  }
}

void testFlatButton() {
  testWidgets('test flat button', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return MaterialApp(
        home: Scaffold(
            body: Center(
          child: FlatButtonTest(),
        )),
      );
    }));
    Finder finder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is UIKitFlatButton && widget.label == "Flat Demo",
    );
    expect(finder, findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.transform), findsOneWidget);
    await tester.tap(find.byType(FlatButtonTest));
    await tester.pump();
    expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is UIKitFlatButton && widget.label == "Flat Clicked",
        ),
        findsOneWidget);
  });
}

void testOutlineButton() {
  testWidgets('test outline button', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return MaterialApp(
        home: Scaffold(
            body: Center(
          child: OutlineButtonTest(),
        )),
      );
    }));

    Finder finder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is UIKitOutlineButton && widget.label == "Outline Demo",
    );
    expect(finder, findsOneWidget);
    expect(find.byIcon(Icons.error), findsOneWidget);
    expect(find.byIcon(Icons.print), findsOneWidget);
    await tester.tap(find.byType(OutlineButtonTest));
    await tester.pump();
    expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is UIKitOutlineButton && widget.label == "Outline Clicked",
        ),
        findsOneWidget);
  });
}

void testTextButton() {
  testWidgets('test text button', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return MaterialApp(
        home: Scaffold(
            body: Center(
          child: TextButtonTest(),
        )),
      );
    }));

    Finder finder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is UIKitTextButton && widget.label == "Text Demo",
    );
    expect(finder, findsOneWidget);
    await tester.tap(find.byType(TextButtonTest));
    await tester.pump();
    expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is UIKitTextButton && widget.label == "Text Clicked",
        ),
        findsOneWidget);
  });
}

void testToggleButton() {
  testWidgets('test toggle button', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return MaterialApp(
        home: Scaffold(
            body: Center(
          child: ToggleButtonTest(),
        )),
      );
    }));

    Finder finder = find.byWidgetPredicate(
      (Widget widget) =>
          widget is UIKitToggleButton && widget.label == "Toggle Demo",
    );
    expect(finder, findsOneWidget);
    expect(find.text("Active"), findsOneWidget);
    expect(find.byIcon(Icons.timer), findsOneWidget);
    expect(find.byIcon(Icons.near_me), findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
    expect(find.text("Deactive"), findsOneWidget);
    Finder finder1 = find.byWidgetPredicate(
      (Widget widget) =>
          widget is UIKitToggleButton && widget.label == "Toggle Deactived",
    );
    expect(finder1, findsOneWidget);
  });
}

void testHubButton() {
  testWidgets('test hub button', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return MaterialApp(
        home: Scaffold(
            body: Center(
          child: HubButtonTest(),
        )),
      );
    }));

    Finder finder = find.byWidgetPredicate(
      (Widget widget) => widget is UIKitHubButton && widget.label == "Hub Demo",
    );
    expect(finder, findsOneWidget);
    expect(find.text("Active"), findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
    expect(find.text("Hub Deactived"), findsOneWidget);
    expect(find.text("Deactive"), findsOneWidget);
  });
}

void main() {
  testFlatButton();
  testOutlineButton();
  testTextButton();
  testToggleButton();
  testHubButton();
}
