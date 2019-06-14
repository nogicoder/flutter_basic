import 'package:flutter/material.dart';
import 'package:uikit_bycn/selection_control/uikitchip.dart';
import 'package:uikit_bycn/header/uikitheader.dart';
import 'package:uikit_bycn/tab_bar/uikittabbar.dart';
import '../models/chipdemo_model.dart';

class ChipDemoPage extends StatefulWidget {
  ChipDemoPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ChipDemoState();
}

class ChipDemoState extends State<ChipDemoPage> {
  var fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  List<bool> _chipVals = <bool>[true, false, false, true, false, true, true];
  List<ChipDemoModel> _chipList1 = [];
  int _currentTabIndex = 0;

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

  Widget renderChipGoodPractice() {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: RichText(
          text: TextSpan(
            text: '',
            style: fontStyle.copyWith(fontWeight: FontWeight.normal),
            children: <TextSpan>[
              TextSpan(text: 'Bonnes pratiques\n\n', style: fontStyle),
              TextSpan(text: 'Le chip est un « selection controls »,'),
              TextSpan(
                text:
                    ' c’est un bouton qui reprend l’usage d’un intérrupteur :',
                style: fontStyle,
              ),
              TextSpan(
                text:
                    ' non sélectionné il ne “filtre” pas, sélectionné, la liste qui le suit sera filtré. ',
              ),
              TextSpan(
                text:
                    'Il n’a alors de sens que lorsque differentes options de filtrages sont présentes. ',
              ),
              TextSpan(
                text:
                    'Il peut aussi etre utilisé comme une fiche d’identité.\n\n',
                style: fontStyle,
              ),
              TextSpan(text: 'Le bouton chip doit '),
              TextSpan(
                  text:
                      'toujours être renseigné par un texte décrivant l’element de filtrage',
                  style: fontStyle),
              TextSpan(
                text: ' que le bouton active ou desactive. Le bouton chip se ',
              ),
              TextSpan(
                text:
                    'place toujours au dessus des élements sur lequels il agit.\n\n',
                style: fontStyle,
              ),
              TextSpan(
                text:
                    'De nombreuses variantes sont possible : avec ou sans icone, avec ou sans “fermer”, avec ou sans texte (ce sera alors un cercle).',
              ),
            ],
          ),
        ));
  }

  getChipDemo() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Text(
                          'Toggle chip',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 9.0,
                      children: <Widget>[
                        UIKitChip(
                          icon: Icons.person_outline,
                          label: 'Chip activated',
                          canClose: true,
                          onClose: () => _showDialog('Handle chip close'),
                          isActivated: _chipVals[0],
                          onTap: (bool value) {
                            setState(() {
                              _chipVals[0] = value;
                            });
                          },
                        ),
                        UIKitChip(
                          label: 'Chip activated',
                          canClose: true,
                          onClose: () => _showDialog('Handle chip close'),
                          isActivated: _chipVals[1],
                          onTap: (bool value) {
                            setState(() {
                              _chipVals[1] = value;
                            });
                          },
                        ),
                        UIKitChip(
                          icon: Icons.person_outline,
                          label: 'Chip activated',
                          isActivated: _chipVals[2],
                          canClose: false,
                          onTap: (bool value) {
                            setState(() {
                              _chipVals[2] = value;
                            });
                          },
                        ),
                        UIKitChip(
                          label: 'Chip activated',
                          isActivated: _chipVals[3],
                          canClose: false,
                          onTap: (bool value) {
                            setState(() {
                              _chipVals[3] = value;
                            });
                          },
                        ),
                        UIKitChip(
                          icon: Icons.person_outline,
                          canClose: false,
                          isActivated: _chipVals[4],
                          onTap: (bool value) {
                            setState(() {
                              _chipVals[4] = value;
                            });
                          },
                        ),
                        UIKitChip(
                          icon: Icons.phone_bluetooth_speaker,
                          canClose: true,
                          onClose: () => _showDialog('Handle chip close'),
                          isActivated: _chipVals[5],
                          onTap: (bool value) {
                            setState(() {
                              _chipVals[5] = value;
                            });
                          },
                        ),
                        UIKitChip(
                          icon: Icons.power_settings_new,
                          canClose: false,
                          isActivated: _chipVals[6],
                          onTap: (bool value) {
                            setState(() {
                              _chipVals[6] = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text(
                        'Disabled chip',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          UIKitChip(
                            icon: Icons.person_outline,
                            label: 'Chip activated',
                            canClose: true,
                            onClose: () => _showDialog('Handle chip close'),
                            isActivated: false,
                            onTap: null,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          UIKitChip(
                            label: 'Chip activated',
                            canClose: true,
                            onClose: () => _showDialog('Handle chip close'),
                            isActivated: true,
                            onTap: null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text(
                        'Input chip',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                      child: RaisedButton(
                        child: Text('Add chip'),
                        onPressed: () {
                          setState(() {
                            _chipList1.add(
                              ChipDemoModel(
                                canClose: true,
                                label: 'Chip',
                                icon: Icons.label,
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 9.0,
                      children: _chipList1
                          .map(
                            (ChipDemoModel chip) => UIKitChip(
                                  icon: chip.icon,
                                  label: chip.label,
                                  canClose: chip.canClose,
                                  isActivated: true,
                                  theme: chip.theme,
                                  onTap: (value) {},
                                  onClose: () {
                                    setState(() {
                                      _chipList1
                                          .removeWhere((o) => o.id == chip.id);
                                    });
                                  },
                                ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
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
          title: Text('Chip'),
        ),
        body: Column(
          children: <Widget>[
            UIKitTabBar(
              currentIndex: _currentTabIndex,
              tabs: [
                UIKitTab(label: 'Good Practice'),
                UIKitTab(label: 'Examples')
              ],
              onTap: (int index) {
                setState(() {
                  _currentTabIndex = index;
                });
              },
            ),
            Expanded(
              child: _currentTabIndex == 0
                  ? renderChipGoodPractice()
                  : getChipDemo(),
            ),
          ],
        ),
      ),
    );
  }
}
