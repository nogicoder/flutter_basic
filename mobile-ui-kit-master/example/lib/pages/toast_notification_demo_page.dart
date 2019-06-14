import 'package:flutter/material.dart';
import 'package:uikit_bycn/tab_bar/uikittabbar.dart';
import 'package:uikit_bycn/header/uikitheader.dart';
import 'package:uikit_bycn/toast_notification/uikittoast.dart';

class ToastDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ToastDemoState();
}

class ToastDemoState extends State<ToastDemoPage> {
  final fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  List<Widget> _pages;
  int _currentIndex = 0;

  _showToast({
    BuildContext context,
    String message,
    UIKitToastType type,
    UIKitToastPosition position,
  }) {
    UIKitToast(message: message, type: type, position: position).showToast(
      context: context,
      duration: Duration(seconds: 3),
    );
  }

  @override
  initState() {
    super.initState();
  }

  Widget _renderGoodPractice() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: RichText(
        text: TextSpan(
          text: '',
          style: fontStyle.copyWith(fontWeight: FontWeight.normal),
          children: <TextSpan>[
            TextSpan(text: 'Bonnes pratiques\n\n', style: fontStyle),
            TextSpan(
                text:
                    'Les onglets organisent le contenu sur différents écrans, permettant d’avoir des « sous rubriques » de navigation sur un écran.\n\nLes onglets organisent et permettent la navigation entre des groupes de contenu liés et se trouvant au même niveau hiérarchique.\n\nLes onglets peuvent être associés à des composants tels que les barres d\'applications supérieures.\n\nIl est impératif que l\'intitulé de l\'onglet soit court et representatif du contenu auquel il renvois.\n\nIl ne doit pas y avoir plus de 3 onglets maximum'),
          ],
        ),
      ),
    );
  }

  Widget _renderExample(BuildContext context) {
    return Container(
      child: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text('Success - Top'),
                onPressed: () => _showToast(
                      context: context,
                      message: 'Success - Top',
                      type: UIKitToastType.success,
                      position: UIKitToastPosition.top,
                    ),
              ),
              RaisedButton(
                child: Text('Success - Bottom'),
                onPressed: () => _showToast(
                      context: context,
                      message: 'Success - Bottom',
                      type: UIKitToastType.success,
                      position: UIKitToastPosition.bottom,
                    ),
              ),
              RaisedButton(
                child: Text('Error - Top'),
                onPressed: () => _showToast(
                      context: context,
                      message: 'Error - Top',
                      type: UIKitToastType.error,
                      position: UIKitToastPosition.top,
                    ),
              ),
              RaisedButton(
                child: Text('Error - Bottom'),
                onPressed: () => _showToast(
                      context: context,
                      message: 'Error - Bottom',
                      type: UIKitToastType.error,
                      position: UIKitToastPosition.bottom,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIKitHeader(
        title: Text('Toast Notification'),
      ),
      body: Column(
        children: <Widget>[
          UIKitTabBar(
            currentIndex: _currentIndex,
            onTap: (int value) {
              setState(() {
                _currentIndex = value;
              });
            },
            tabs: [
              UIKitTab(label: 'Good Practice'),
              UIKitTab(label: 'Examples'),
            ],
          ),
          Expanded(
            child: _currentIndex == 0
                ? _renderGoodPractice()
                : _renderExample(context),
          )
        ],
      ),
    );
  }
}
