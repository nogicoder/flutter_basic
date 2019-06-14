import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_bycn/interactive_elements/uikitavatar.dart';

class AvatarTest extends StatefulWidget {
  @override
  State<AvatarTest> createState() => _AvatarStateTest();
}

class _AvatarStateTest extends State<AvatarTest> {
  @override
  Widget build(BuildContext context) {
    return UIKitAvatar(
      size: UIKitAvatarSize.LARGE,
      avatarStyle: UIKitAvatarStyle.SUBTITLE,
      subTitle: "Subtitle",
      title: "Avatar",
      usingDefaultAvatar: true,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text("handle actions"),
              );
            });
      },
    );
  }
}

void testAvatar() {
  testWidgets('test avatar', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return MaterialApp(
        home: Scaffold(
            body: Center(
          child: AvatarTest(),
        )),
      );
    }));

    expect(find.text("Avatar"), findsOneWidget);
    expect(find.text("Subtitle"), findsOneWidget);
    await tester.tap(find.byType(InkWell));
    await tester.pump();
    expect(find.text("handle actions"), findsOneWidget);
  });
}

void main() {
  testAvatar();
}
