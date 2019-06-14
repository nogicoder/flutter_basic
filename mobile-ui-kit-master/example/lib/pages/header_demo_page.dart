import 'package:flutter/material.dart';
import 'package:uikit_bycn/header/uikitheader.dart';

class HeaderDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HeaderDemoState();
}

class HeaderDemoState extends State<HeaderDemoPage> {
  final fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);

  Widget _renderGoodPractice() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: '',
              style: fontStyle.copyWith(fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(text: 'Bonnes pratiques\n\n', style: fontStyle),
                TextSpan(
                  text:
                      'L’utilisation du Header doit être priorisé sur tout autres formes de navigation.\n\n',
                  style: fontStyle,
                ),
                TextSpan(text: 'Il peut etre utilisé dans '),
                TextSpan(
                  text:
                      'divers cas de figures pour, par exemple, héberger un menu burger ',
                  style: fontStyle,
                ),
                TextSpan(
                    text:
                        'afin d’y ranger les élements d’information sur l’application (numéro de version) ou le logo. Contrairement à la Tab Bar, toutes les applications ont un Header.\n\n'),
                TextSpan(text: 'L’entrée de '),
                TextSpan(
                  text:
                      'active généralement un panneau soit latéral, soit en plein écran.\n\n',
                  style: fontStyle,
                ),
                TextSpan(
                    text:
                        'Le fond du menu est blanc mais dispose d’une ombre portée orienté vers le haut, destiné a mettre en avant le menu, peu importe la couleur de fond utilisé en arrière plan.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: UIKitHeader(
          title: Text('Header'),
        ),
        body: Container(
          color: Colors.teal,
          child: Column(
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Scaffold(
                    appBar: UIKitHeader(
                      leading: Container(),
                      title: Text('Good practice'),
                    ),
                    body: SingleChildScrollView(
                      child: _renderGoodPractice(),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Scaffold(
                    drawer: Container(
                      color: Colors.black26,
                      child: Container(
                        color: Colors.white,
                        width: 160.0,
                      ),
                    ),
                    appBar: UIKitHeader(
                      title: Text('With sidebar'),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Container(
                        height: 56.0,
                        child: Scaffold(
                          appBar: UIKitHeader(
                            actions: <Widget>[
                              IconButton(
                                icon: Icon(Icons.playlist_play),
                                tooltip: 'Air it',
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.playlist_add),
                                tooltip: 'Restitch it',
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
