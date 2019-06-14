import 'package:flutter/material.dart';
import 'package:uikit_bycn/text_fields/uikittextfield.dart';
import 'package:uikit_bycn/header/uikitheader.dart';
import 'package:uikit_bycn/tab_bar/uikittabbar.dart';

class TextFieldDemoPage extends StatefulWidget {
  TextFieldDemoPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemoPage> {
  final fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  final RegExp _emailTemplate = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  String _password, _confirmPassword;
  int _currentTabIndex = 0;

  Widget _renderGoodPractice() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: RichText(
        text: TextSpan(
          text: '',
          style: fontStyle.copyWith(fontWeight: FontWeight.normal),
          children: <TextSpan>[
            TextSpan(text: 'Bonnes pratiques\n\n', style: fontStyle),
            TextSpan(text: 'Le design des champs texte est '),
            TextSpan(
              text: 'directement inspiré de Materiel Design ',
              style: fontStyle,
            ),
            TextSpan(text: '(android OS)\n\n'),
            TextSpan(
                text:
                    'Le comportement par defaut est d’indiquer l’intitulé du champs, dans le champs, celui-ci se transforme en « label » lorsque le champ est rempli.\n\n'),
            TextSpan(
                text:
                    'Les messages d’erreur, suivent également le comportement de Materiel theming, à savoir ; '),
            TextSpan(
              text:
                  'le label prend alors la couleur rouge et le detail de l’erreur s’affiche sous le champs concerné.',
              style: fontStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderTextDemo() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text('Text', style: fontStyle),
            UIKitTextField(
              type: UIKitTextFieldType.text,
              label: 'Text field',
              hint: 'Type some texts here...',
            ),
            UIKitTextField(
              type: UIKitTextFieldType.text,
              label: 'Disabled field',
              value: 'This field is disabled',
              enabled: false,
            )
          ],
        ),
      ),
    );
  }

  Widget _renderPasswordDemo() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text('Password', style: fontStyle),
            UIKitTextField(
              type: UIKitTextFieldType.password,
              label: 'Password field',
              value: _password,
              hint: 'Your password will be hidden',
              onChanged: (String value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            UIKitTextField(
              type: UIKitTextFieldType.password,
              label: 'Confirm password + validator',
              value: _confirmPassword,
              onChanged: (String value) {
                setState(() {
                  _confirmPassword = value;
                });
              },
              hint: 'Your password will be hidden',
              error: 'Your password and confirm password does not match',
              validator: (String value) => value == _password,
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderEmailDemo() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text('Email', style: fontStyle),
            UIKitTextField(
              type: UIKitTextFieldType.email,
              label: 'Email field',
              hint: 'example@mail.com',
            ),
            UIKitTextField(
              type: UIKitTextFieldType.email,
              label: 'Email field + validator',
              hint: 'example@mail.com',
              error: 'Email is invalid!',
              validator: (String value) => _emailTemplate.hasMatch(value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderOtherDemos() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text('Others', style: fontStyle),
            UIKitTextField(
              type: UIKitTextFieldType.number,
              label: 'Number field',
              hint: 'Decimal values',
            ),
            UIKitTextField(
              type: UIKitTextFieldType.phone,
              label: 'Phone number field',
              hint: '(+33)123456789',
            ),
            UIKitTextField(
              type: UIKitTextFieldType.phone,
              label: 'Phone number field + Icon',
              hint: '(+33)123456789',
              suffixIcon: Icons.phone,
            ),
            UIKitTextField(
              type: UIKitTextFieldType.url,
              label: 'Url field',
              hint: 'www.example.com',
            ),
          ],
        ),
      ),
    );
  }

  _renderDemo() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              _renderTextDemo(),
              _renderPasswordDemo(),
              _renderEmailDemo(),
              _renderOtherDemos(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: UIKitHeader(
            title: Text('Text Fields'),
          ),
          body: Column(
            children: <Widget>[
              UIKitTabBar(
                currentIndex: _currentTabIndex,
                tabs: [
                  UIKitTab(label: 'Good Practice'),
                  UIKitTab(label: 'Examples'),
                ],
                onTap: (int index) {
                  setState(() {
                    _currentTabIndex = index;
                  });
                },
              ),
              Expanded(
                child: _currentTabIndex == 1 ? _renderDemo() : _renderGoodPractice(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
