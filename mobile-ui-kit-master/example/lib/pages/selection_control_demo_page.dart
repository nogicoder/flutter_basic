import 'package:flutter/material.dart';
import 'package:uikit_bycn/selection_control/uikitcheckbox.dart';
import 'package:uikit_bycn/selection_control/uikitswitch.dart';
import 'package:uikit_bycn/selection_control/uikitradiobutton.dart';
import 'package:uikit_bycn/header/uikitheader.dart';
import 'package:uikit_bycn/tab_bar/uikittabbar.dart';

class SelectionControlDemoPage extends StatefulWidget {
  SelectionControlDemoPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SelectionControlDemoState();
}

class SelectionControlDemoState extends State<SelectionControlDemoPage> {
  var fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  bool _checkboxVal = false;
  bool _switchVal = false;
  int _radioVal = 0;
  int _currentTabIndex = 0;

  Widget renderRadioButtonGoodPractice() {
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
                    'Le bouton radio, fait parti de la famille des « selection controls », c’est un bouton de selection à choix unique, contrairement au checkbox.\n\nLe bouton radio ne doit pas être utilisé entre lieu et place du bouton « switch », en placant par exemple, deux boutons radio sur la même ligne.\n\nLe placement du bouton radio, doit se faire en fonction de l’alignement gauche du texte et des autres éléments (texte / champs de saisie, etc.).  Exemple : pour la page login, il peut être décalé vers le centre avec le texte, mais, il faut de préférence être aligné a gauche, au même niveau que les éléments de l’écran. '),
          ],
        ),
      ),
    );
  }

  Widget getRadioDemo() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  UIKitRadioButton(
                    label: 'Radio 1',
                    value: 0,
                    groupValue: _radioVal,
                    onChanged: (value) {
                      setState(() {
                        _radioVal = 0;
                      });
                    },
                  ),
                  UIKitRadioButton(
                    label: 'Radio 2',
                    value: 1,
                    groupValue: _radioVal,
                    onChanged: (value) {
                      setState(() {
                        _radioVal = 1;
                      });
                    },
                  ),
                  UIKitRadioButton(
                    value: 2,
                    groupValue: _radioVal,
                    onChanged: (value) {
                      setState(() {
                        _radioVal = 2;
                      });
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    UIKitRadioButton(
                      label: 'Disabled active',
                      value: 0,
                      groupValue: 0,
                    ),
                    UIKitRadioButton(
                      label: 'Disabled',
                      value: 1,
                      groupValue: 0,
                    ),
                    UIKitRadioButton(
                      value: 0,
                      groupValue: 1,
                    ),
                  ],
                ),
              ),
              renderRadioButtonGoodPractice(),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderCheckboxGoodPractice() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: RichText(
        text: TextSpan(
          text: '',
          style: fontStyle.copyWith(fontWeight: FontWeight.normal),
          children: <TextSpan>[
            TextSpan(text: 'Bonnes pratiques\n\n', style: fontStyle),
            TextSpan(text: 'La checkbox, fait parti de la famille des '),
            TextSpan(
              text: '« selection controls »',
              style: fontStyle,
            ),
            TextSpan(
              text:
                  ', c’est un bouton de selection à choix multiple, contrairement au bouton radio.\n\n',
            ),
            TextSpan(
              text:
                  'La checkbox ne doit pas être utilisé en lieu et place du bouton radio, si il n’y a que deux choix unique possible.\n\n',
            ),
            TextSpan(
              text:
                  'Le placement de la checkbox, doit se faire en fonction de l’alignement gauche du texte et des autres éléments (texte / champs de saisie, etc.).',
            )
          ],
        ),
      ),
    );
  }

  Widget getCheckboxDemo() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: UIKitCheckbox(
                      label: 'Checkbox',
                      value: _checkboxVal,
                      onChanged: (bool value) {
                        setState(() {
                          _checkboxVal = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: UIKitCheckbox(
                      label: 'Disabled',
                      value: false,
                      onChanged: null,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: UIKitCheckbox(
                      label: 'Disabled',
                      value: true,
                      onChanged: null,
                    ),
                  ),
                )
              ],
            ),
            renderCheckboxGoodPractice(),
          ],
        ),
      ),
    );
  }

  Widget renderSwitchGoodPractice() {
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
                  'Le bouton switch, fait parti de la famille des « selection controls »,',
            ),
            TextSpan(
              text: ' c’est un bouton qui reprend l’usage d’un intérrupteur',
              style: fontStyle,
            ),
            TextSpan(
              text:
                  ' et qui à pour but d’activer ou de desactiver une option.\n\n',
            ),
            TextSpan(
              text:
                  'Le switch ne doit pas être utilisé en lieu et place du bouton radio, ou de la checkbox.\n\n',
            ),
            TextSpan(text: 'Le bouton switch doit '),
            TextSpan(
              text:
                  '« toujoirs être renseigné par un texte décrivant l\'action  »',
              style: fontStyle,
            ),
            TextSpan(text: ' que le bouton active ou desactive.\n\n'),
            TextSpan(text: 'Le bouton switch se'),
            TextSpan(
              text: '« place toujours à driote du texte qui l\'accompagne ».',
              style: fontStyle,
            ),
          ],
        ),
      ),
    );
  }

  getSwitchDemo() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: UIKitSwitch(
                      label: 'Switch',
                      value: _switchVal,
                      onChanged: (bool value) {
                        setState(() {
                          _switchVal = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                    child: Center(
                        child: UIKitSwitch(
                            label: 'Disabled', value: true, onChanged: null))),
                Expanded(
                    child: Center(
                        child: UIKitSwitch(
                            label: 'Disabled', value: false, onChanged: null))),
              ],
            ),
            renderSwitchGoodPractice(),
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
          title: Text('Selection Controls'),
        ),
        body: Column(
          children: <Widget>[
            UIKitTabBar(
              currentIndex: _currentTabIndex,
              tabs: [
                UIKitTab(label: 'Radio'),
                UIKitTab(label: 'Checkbox'),
                UIKitTab(label: 'Switch'),
              ],
              onTap: (int index) {
                setState(() {
                  _currentTabIndex = index;
                });
              },
            ),
            Expanded(
              child: _currentTabIndex == 0
                  ? getRadioDemo()
                  : (_currentTabIndex == 1
                      ? getCheckboxDemo()
                      : getSwitchDemo()),
            ),
          ],
        ),
      ),
    );
  }
}
