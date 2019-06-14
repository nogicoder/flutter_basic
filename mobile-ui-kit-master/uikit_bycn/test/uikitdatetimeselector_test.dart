import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:uikit_bycn/interactive_elements/datetime/uikitdatetimeselector.dart';

class DateTimeSelectorTest extends StatefulWidget {
  @override
  State<DateTimeSelectorTest> createState() => DateTimeSelectorStateTest();
}

class DateTimeSelectorStateTest extends State<DateTimeSelectorTest> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          UIKitDateTimeSelector(
              onChanged: (onValue) {
                setState(() {
                  selectedDate = onValue;
                });
              },
              firstDate: DateTime.now().add(Duration(days: -200)),
              lastDate: DateTime.now().add(Duration(days: 200)))
        ],
      ),
    );
  }
}

testDateTimeSelector() {
  testWidgets("test datetime selector", (WidgetTester tester) async {
    await tester.pumpWidget(
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return MaterialApp(
        home: Scaffold(
            body: Center(
          child: DateTimeSelectorTest(),
        )),
      );
    }));
    expect(find.byIcon(Icons.event), findsOneWidget);
    expect(find.byIcon(Icons.access_time), findsOneWidget);
  });
}

void main() {
  testDateTimeSelector();
}
