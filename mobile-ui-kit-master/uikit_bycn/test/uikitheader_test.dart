import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/header/uikitheader.dart';

void main() {
  testWidgets('Header test', (WidgetTester tester) async {
    List<bool> isPressed = [false, false, false];
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return MaterialApp(
            home: Scaffold(
              drawerDragStartBehavior: DragStartBehavior.down,
              drawer: Container(
                width: 200.0,
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Drawer'),
                      ],
                    )
                  ],
                ),
              ),
              appBar: UIKitHeader(
                title: Text('Header'),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.playlist_play),
                    onPressed: () {
                      setState(() {
                        isPressed[0] = true;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.playlist_add),
                    onPressed: () {
                      setState(() {
                        isPressed[1] = true;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.playlist_add_check),
                    onPressed: () {
                      setState(() {
                        isPressed[2] = true;
                      });
                    },
                  ),
                ],
              ),
              body: Container(),
            ),
          );
        },
      ),
    );

    expect(find.text('Header'), findsOneWidget);
    expect(find.text('Drawer'), findsNothing);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byIcon(Icons.playlist_play), findsOneWidget);
    expect(find.byIcon(Icons.playlist_add), findsOneWidget);
    expect(find.byIcon(Icons.playlist_add_check), findsOneWidget);

    // try to tap burgur icon to show drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Drawer'), findsOneWidget);
    // try outside tap to close drawer
    await tester.tapAt(const Offset(300.0, 0));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Drawer'), findsNothing);
    await tester.pump();

    // try to swipe right at the left rear to show drawer
    await tester.dragFrom(
        const Offset(10.0, 300.0), const Offset(600.0, 300.0));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Drawer'), findsOneWidget);
    // try to swipe left to close drawer
    await tester.drag(find.text('Drawer'), const Offset(-200.0, 0));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Drawer'), findsNothing);

    // check tapping on actions
    await tester.tap(find.byIcon(Icons.playlist_add));
    expect(isPressed, equals([false, true, false]));
    await tester.tap(find.byIcon(Icons.playlist_play));
    await tester.tap(find.byIcon(Icons.playlist_add_check));
    expect(isPressed, equals([true, true, true]));
  });
}
