import 'package:flutter/material.dart';
import 'package:uikit_bycn/cards/uikitcard.dart';
import 'package:uikit_bycn/tab_bar/uikittabbar.dart';
import 'package:uikit_bycn/header/uikitheader.dart';
import 'package:uikit_bycn/selection_control/uikitcheckbox.dart';

class CardDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CardDemoState();
}

class CardDemoState extends State<CardDemoPage> {
  final fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  int _currentTabIndex = 0;
  bool _hasImage = false;
  bool _hasStatus = false;
  bool _hasConfirmAction = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIKitHeader(
        title: Text('Card'),
      ),
      body: Column(
        children: <Widget>[
          UIKitTabBar(
            currentIndex: _currentTabIndex,
            onTap: (int value) {
              setState(() {
                _currentTabIndex = value;
              });
            },
            tabs: [
              UIKitTab(label: 'Good Practice'),
              UIKitTab(label: 'Layout 1'),
              UIKitTab(label: 'Layout 2'),
            ],
          ),
          _currentTabIndex > 0 ? Row(
            children: <Widget>[
              _currentTabIndex == 2
                  ? Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(8.0, 16.0, 0.0, 16.0),
                        child: UIKitCheckbox(
                          label: 'Image',
                          value: _hasImage,
                          onChanged: (bool value) {
                            setState(() {
                              _hasImage = value;
                            });
                          },
                        ),
                      ),
                    )
                  : Container(),
              _currentTabIndex == 2
                  ? Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: UIKitCheckbox(
                          label: 'Status',
                          value: _hasStatus,
                          onChanged: (bool value) {
                            setState(() {
                              _hasStatus = value;
                            });
                          },
                        ),
                      ),
                    )
                  : Container(),
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: UIKitCheckbox(
                      label: 'Confirm action',
                      value: _hasConfirmAction,
                      onChanged: (bool value) {
                        setState(() {
                          _hasConfirmAction = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ) : Container(),
          _currentTabIndex == 0 ? _buildGoodPractice() : Expanded(
            child: Container(
              color: Colors.teal,
              child: _buildList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildCard();
      },
    );
  }

  Widget _buildCard() {
    switch (_currentTabIndex) {
      case 2:
        return UIKitCard(
          layout: UIKitCardLayout.layout2,
          title: 'Nom document',
          content:
              'Inter haec Orfitus praefecti potestate regebat urbem aeternam ultra modum delatae dignitatis sese efferens insolenter.',
          photo: _hasImage ? AssetImage('assets/images/Bitmap.png') : null,
          hasStatus: _hasStatus,
          confirmAction: _hasConfirmAction
              ? OutlineButton(
                  child: Text('OK?'),
                  onPressed: () => _showDialog('OK!'),
                )
              : null,
        );
      case 1:
        return UIKitCard(
          layout: UIKitCardLayout.layout1,
          title: 'Nom document',
          content:
              'Inter haec Orfitus praefecti potestate regebat urbem aeternam ultra modum delatae dignitatis sese efferens insolenter.',
          photo: AssetImage('assets/images/Bitmap.png'),
          confirmAction: _hasConfirmAction
              ? OutlineButton(
                  child: Text('OK?'),
                  onPressed: () => _showDialog('OK!'),
                )
              : null,
        );
      default:
        return Container();
    }
  }

  _buildGoodPractice() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: RichText(
        text: TextSpan(
          text: '',
          style: fontStyle.copyWith(fontWeight: FontWeight.normal),
          children: <TextSpan>[
            TextSpan(text: 'Bonnes pratiques\n', style: fontStyle),
            TextSpan(
                text:
                    'Chaque carte est composée de blocs de contenu. Tous les blocs, dans leur ensemble, sont liés à un seul sujet ou à une seule destination.\n\n'),
            TextSpan(
                text:
                    'Un seul style de card doit être utilisé et repeté par écran, il ne faut en aucun cas avoir plusieurs styles de card dans un même écran.\n\n'),
            TextSpan(
                text:
                    'Les cartes peuvent également avoir un bouton de confirmation. Dans ce cas de figure, le style de texte utilisé sera le texte tertiaire.\n\n'),
          ],
        ),
      ),
    );
  }

  void _showDialog(msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Alert'),
          content: new Text(msg),
        );
      },
    );
  }
}
