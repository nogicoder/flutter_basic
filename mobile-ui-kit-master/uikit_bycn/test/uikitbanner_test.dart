import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/interactive_elements/banner/uikitbanner.dart';

class BannerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: RaisedButton(onPressed: () {
      UIKitBanner(
        bannerPosition: UIKitBannerPosition.BOTTOM,
        body: Text("Banner Demo"),
        duration: Duration(seconds: 2),
      )..show(context);
    }));
  }
}

void testBanner() {
  testWidgets('test banner', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return MaterialApp(
        home: Scaffold(
            body: Center(
          child: BannerTest(),
        )),
      );
    }));

    Finder button = find.byWidgetPredicate(
      (Widget widget) => widget is RaisedButton,
    );
    await tester.tap(button);
    await tester.pump();
    expect(find.text("Banner Demo"), findsOneWidget);
    await tester.pump();
    await tester.pump(Duration(seconds: 3));
    expect(find.text("Banner Demo"), findsNothing);
  });
}

void main() {
  testBanner();
}
