import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/interactive_elements/uikitdialog.dart';

class DialogTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: RaisedButton(onPressed: () {
      UIKitDialog.show(
          context: context,
          title: Text("Title"),
          content: Text("Content"),
          onPressedOK: () {
            Navigator.of(context).pop();
          },
          onPressedCancel: () {
            Navigator.of(context).pop();
          });
    }));
  }
}

void testDialog() {
  testWidgets('test dialog', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return MaterialApp(
        home: Scaffold(
            body: Center(
          child: DialogTest(),
        )),
      );
    }));

    Finder button = find.byWidgetPredicate(
      (Widget widget) => widget is RaisedButton,
    );
    await tester.tap(button);
    await tester.pump();
    expect(find.text("Title"), findsOneWidget);
    expect(find.text("OK"), findsOneWidget);
    await tester.tap(find.text("OK"));
    await tester.pump();
    expect(find.text("Title"), findsNothing);

    await tester.tap(button);
    await tester.pump();
    expect(find.text("Title"), findsOneWidget);
    expect(find.text("OK"), findsOneWidget);
    await tester.tap(find.text("ANNULER"));
    await tester.pump();
    expect(find.text("Title"), findsNothing);
  });
}

void main() {
  testDialog();
}
