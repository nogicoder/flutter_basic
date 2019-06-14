import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/tab_bar/uikittabbar.dart';

void main() {
  testWidgets('Tab bar test', (WidgetTester tester) async {
    Widget body = Container(
      child: Text('Body 1'),
    );
    int currentIndex = 0;
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return MaterialApp(
            home: Scaffold(
              body: Column(
                children: <Widget>[
                  UIKitTabBar(
                    currentIndex: currentIndex,
                    tabs: [
                      UIKitTab(label: 'Tab 1'),
                      UIKitTab(label: 'Tab 2'),
                      UIKitTab(label: 'Tab 3'),
                    ],
                    onTap: (int index) {
                      setState(() {
                        currentIndex = index;
                        body = Container(
                          child: Text('Body ${index + 1}'),
                        );
                      });
                    },
                  ),
                  Expanded(
                    child: body,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    expect(find.text('Tab 1'), findsOneWidget);
    expect(find.text('Tab 2'), findsOneWidget);
    expect(find.text('Tab 3'), findsOneWidget);
    expect(find.text('Body 1'), findsOneWidget);

    await tester.tap(find.text('Tab 1'));
    await tester.pump();
    expect(find.text('Body 1'), findsOneWidget);

    await tester.tap(find.text('Tab 2'));
    await tester.pump();
    expect(find.text('Body 2'), findsOneWidget);

    await tester.tap(find.text('Tab 3'));
    await tester.pump();
    expect(find.text('Body 3'), findsOneWidget);
  });
}
