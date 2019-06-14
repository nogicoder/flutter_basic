import 'package:flutter/material.dart';
import 'package:uikit_bycn/bottom_navigation/uikitbottomnavbar.dart';
import 'package:uikit_bycn_example/pages/selection_control_demo_page.dart';
import 'package:uikit_bycn_example/pages/text_field_demo_page.dart';
import 'package:uikit_bycn_example/models/icons.dart';
import 'package:uikit_bycn/header/uikitheader.dart';

class BottomNavBarDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavBarDemoState();
}

class BottomNavBarDemoState extends State<BottomNavBarDemoPage> {
  final fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _renderBody() {
    return UIKitBottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        UIKitBottomNavigationItem(
          title: 'Good practice',
          icon: Icons.home,
          body: _renderGoodPractice(),
        ),
        UIKitBottomNavigationItem(
          title: 'List',
          icon: Icons.list,
          body: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text('Lorem Ipsum'),
              subtitle: Text('$index'),
            );
          }),
        ),
        UIKitBottomNavigationItem(
          title: 'Text Fields',
          icon: GalleryIcons.text_fields_alt,
          body: TextFieldDemoPage(),
        ),
        UIKitBottomNavigationItem(
          title: 'Selection Controls',
          icon: GalleryIcons.check_box,
          body: SelectionControlDemoPage(),
        )
      ],
    );
  }

  Widget _renderGoodPractice() {
    return Builder(
      builder: (BuildContext context) => Container(
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
                            'L’utilisation du Tab Bar doit être priorisé sur tout autres formes de navigation.\n\n',
                        style: fontStyle,
                      ),
                      TextSpan(text: 'Il ne doit '),
                      TextSpan(
                        text: 'pas être utilisé au dela de 5 entrées ',
                        style: fontStyle,
                      ),
                      TextSpan(text: 'de menu maximum, et '),
                      TextSpan(
                        text:
                            'son utilité débute à partir de 3 entrées de menu minimum.\n\n',
                        style: fontStyle,
                      ),
                      TextSpan(text: 'L’entrée de '),
                      TextSpan(
                        text:
                            'menu active utilise la couleur primaire orange, ',
                        style: fontStyle,
                      ),
                      TextSpan(
                        text:
                            'de manière à distinguer rapidement le menu actif du menu inactif.\n\n',
                      ),
                      TextSpan(
                        text:
                            'Le fond du menu est blanc mais dispose d’une ombre portée orienté vers le haut, destiné a mettre en avant le menu, peu importe la couleur de fond utilisé en arrière plan.',
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('Go to Buttons'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('button');
                  },
                ),
                RaisedButton(
                  child: Text('Go to Text Fields'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('text');
                  },
                ),
                RaisedButton(
                  child: Text('Go to Sel. Controls'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('selection');
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: UIKitHeader(
          title: Text('Bottom Navigation Bar'),
        ),
        body: _renderBody(),
      ),
    );
  }
}
