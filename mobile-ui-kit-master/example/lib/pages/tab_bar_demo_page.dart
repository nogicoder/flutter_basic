import 'package:flutter/material.dart';
import 'package:uikit_bycn/tab_bar/uikittabbar.dart';
import 'package:uikit_bycn/header/uikitheader.dart';

class TabBarDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabBarDemoState();
}

class TabBarDemoState extends State<TabBarDemoPage> {
  final fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  List<Widget> _pages;
  int _currentIndex = 0;

  @override
  initState() {
    super.initState();
    _pages = [
      _renderGoodPractice(),
      Container(
        color: Colors.green,
      ),
      Container(color: Colors.blue)
    ];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIKitHeader(
        title: Text('Tab bar'),
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
              UIKitTab(label: 'Green'),
              UIKitTab(label: 'Blue'),
            ],
          ),
          Expanded(
            child: _pages[_currentIndex],
          )
        ],
      ),
    );
  }
}
