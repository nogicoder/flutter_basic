import 'dart:math';
import 'package:flutter/material.dart';
import 'package:uikit_bycn/buttons/uikitbutton.dart';
import 'package:uikit_bycn/buttons/uikitbuttonthemedata.dart';
import 'package:uikit_bycn/buttons/uikithubbutton.dart';

class ButtonDemoPage extends StatefulWidget {
  @override
  State<ButtonDemoPage> createState() => ButtonDemoState();
}

class ButtonDemoState extends State<ButtonDemoPage> {
  var fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  //using to set active toggle
  bool isActivated = false;

  onPressButton() {
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            content: Text("Handle Button"),
          );
        });
  }

  Widget getFlatButtonDemo() {
    return SingleChildScrollView(
        child: Center(
            child: Column(children: <Widget>[
      UIKitButton(
          label: "Press Me",
          buttonType: UIKITBUTTONTYPE.FLAT,
          onPressed: onPressButton),
      UIKitButton(
          label: "Press Me",
          buttonType: UIKITBUTTONTYPE.FLAT,
          onPressed: onPressButton),
      UIKitButton(
          label: "Disabled Button",
          buttonType: UIKITBUTTONTYPE.FLAT,
          onPressed: null),
      Container(
          padding: EdgeInsets.all(20.0),
          child: RichText(
            text: TextSpan(
              text: '',
              style: fontStyle.copyWith(fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(text: 'Bonnes pratiques\n', style: fontStyle),
                TextSpan(
                    text: 'Le bouton principal doit être utilisé pour une '),
                TextSpan(
                  text: 'action « positive » principale.\n',
                  style: fontStyle,
                ),
                TextSpan(
                    text:
                        'Exemple : Se connecter, Retenter une connexion, etc.\n\n'
                        'Le bouton principal doit '),
                TextSpan(
                    text:
                        's’adapter à la largeur de l’écran, en fonction du Device utilisé, ',
                    style: fontStyle),
                TextSpan(
                    text: 'en prenant garde de conserver les même marges.\n\n'),
                TextSpan(
                    text:
                        'Le bouton principal peut être disposé a coté d’un bouton secondaire, il doit '),
                TextSpan(
                    text: 'obligatoirement être positionné à droite, ',
                    style: fontStyle),
                TextSpan(text: 'comme toutes actions « positives ».')
              ],
            ),
          ))
    ])));
  }

  Widget getOutlineButtonDemo() {
    return SingleChildScrollView(
        child: Center(
            child: Column(children: <Widget>[
      UIKitButton(
          label: "Press Me",
          buttonType: UIKITBUTTONTYPE.OUTLINE,
          onPressed: onPressButton),
      UIKitButton(
          label: "Disabled Button",
          buttonType: UIKITBUTTONTYPE.OUTLINE,
          onPressed: null),
      Container(
          padding: EdgeInsets.all(20.0),
          child: RichText(
            text: TextSpan(
              text: '',
              style: fontStyle.copyWith(fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(text: 'Bonnes pratiques\n', style: fontStyle),
                TextSpan(
                    text: 'Le bouton secondaire doit être utilisé pour une '),
                TextSpan(
                  text:
                      'action « négative » ou une action qui ne nécessite pas une attention particulière.\n',
                  style: fontStyle,
                ),
                TextSpan(text: 'Exemple : Annuler, effacer etc.\n\nIl doit '),
                TextSpan(
                    text:
                        's’adapter à la largeur de l’écran, en fonction du Device utilisé, ',
                    style: fontStyle),
                TextSpan(text: 'en respectant les même marges.\n\n'),
                TextSpan(
                    text:
                        'Le bouton secondaire peut être disposé a coté d’un autre bouton secondaire.\n\n'),
                TextSpan(text: 'Il doit '),
                TextSpan(
                    text: 'obligatoirement être positionné à gauche, ',
                    style: fontStyle),
                TextSpan(
                    text:
                        'lorsqu’il est sur la même ligne qu’un bouton principal.')
              ],
            ),
          ))
    ])));
  }

  Widget geTextButtonDemo() {
    return SingleChildScrollView(
        child: Center(
            child: Column(children: <Widget>[
      UIKitButton(
          label: "Press Me",
          buttonType: UIKITBUTTONTYPE.TEXT,
          onPressed: onPressButton),
      UIKitButton(
          label: "Disabled Button",
          buttonType: UIKITBUTTONTYPE.TEXT,
          onPressed: null),
      Container(
          padding: EdgeInsets.all(20.0),
          child: RichText(
            text: TextSpan(
              text: '',
              style: fontStyle.copyWith(fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(text: 'Bonnes pratiques\n', style: fontStyle),
                TextSpan(
                    text: 'Le bouton tertiaire doit être utilisé pour une '),
                TextSpan(
                  text:
                      'action non prioritaire, non intrusive, il est reservé à l’usage des bannières et des cards.\n\n',
                  style: fontStyle,
                ),
                TextSpan(
                    text:
                        'Le bouton tertiaire peut être disposé a coté d’un autre bouton tertiaire, si besoin.\n\n'),
                TextSpan(text: 'Il doit '),
                TextSpan(
                    text: 'obligatoirement être positionné à droite, ',
                    style: fontStyle),
                TextSpan(
                    text:
                        ' il ne peut en aucuns cas, être disposé à coté d’un bouton primaire, ou d’un bouton secondaire.'),
              ],
            ),
          ))
    ])));
  }

  Widget getToggleButtonDemo() {
    return SingleChildScrollView(
        child: Center(
            child: Column(children: <Widget>[
      UIKitButton(
          label: "Toggle Button",
          buttonType: UIKITBUTTONTYPE.TOGGLE,
          onStateChanged: (isActivated) {
            setState(() {
              this.isActivated = isActivated;
            });
          },
          leftIcon: Icons.timer,
          onPressed: () {}),
      UIKitButton(
          label: isActivated ? "Toggle Button" : "Dissabled Toggle",
          buttonType: UIKITBUTTONTYPE.TOGGLE,
          onPressed: isActivated ? onPressButton : null),
      Container(
          padding: EdgeInsets.all(20.0),
          child: RichText(
            text: TextSpan(
              text: '',
              style: fontStyle.copyWith(fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(text: 'Bonnes pratiques\n', style: fontStyle),
                TextSpan(text: 'Le bouton toggle doit être utilisé pour une '),
                TextSpan(
                  text: 'action dont le résultat est binaire et constante.\n',
                  style: fontStyle,
                ),
                TextSpan(
                    text:
                        'Exemple : Suivre/Arreter de suivre sur Twitter.\n\n'),
                TextSpan(
                  text:
                      'L’icone est optionnelle mais fortement conseillé afin de marquer une différence avec le bouton secondaire.',
                ),
                TextSpan(
                    text:
                        'Le texte doit exprimer clairement qu’un action se lance ou cesse ',
                    style: fontStyle),
                TextSpan(text: ' entre les phase “non lancé” et “lancé”.\n\n'),
                TextSpan(text: 'Il doit '),
                TextSpan(
                    text:
                        'idéalement être positionné sur la moitié droite de l’écran ',
                    style: fontStyle),
                TextSpan(text: 'pour faciliter son accès avec le pouce.')
              ],
            ),
          ))
    ])));
  }

  Color get randomColor => Color.fromARGB(
      255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
  Widget getHubButtonDemo() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UIKitHubButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text("Handle actions"),
                          );
                        });
                  },
                ),
                UIKitHubButton(
                  icon: Icons.message,
                  iconColor: randomColor,
                  iconHighlightColor: randomColor,
                  backgroundColor: randomColor,
                  highlightColor: randomColor,
                ),
                UIKitHubButton(
                  label: "Settings",
                  icon: Icons.settings,
                  iconColor: randomColor,
                  iconHighlightColor: randomColor,
                  backgroundColor: randomColor,
                  highlightColor: randomColor,
                ),
                UIKitHubButton(
                  icon: Icons.close,
                  iconColor: randomColor,
                  iconHighlightColor: randomColor,
                  backgroundColor: randomColor,
                  highlightColor: randomColor,
                )
              ],
            ),
            Container(
                padding: EdgeInsets.all(20.0),
                child: RichText(
                  text: TextSpan(
                    text: '',
                    style: fontStyle.copyWith(fontWeight: FontWeight.normal),
                    children: <TextSpan>[
                      TextSpan(text: 'Bonnes pratiques\n', style: fontStyle),
                      TextSpan(
                          text:
                              'Ce composant est une déclinaison des boutons principaux. Cette forme de bouton est une '),
                      TextSpan(
                        text:
                            'variante dédié à la mise en firme d’une page d’accès à diverses fonctions ',
                        style: fontStyle,
                      ),
                      TextSpan(text: 'sur le principe d’un HUB de fonction.\n'),
                      TextSpan(
                        text:
                            ' Il peut être utilisé servir dans des menus. L’objectif de cet element est ',
                      ),
                      TextSpan(
                          text:
                              'd’apporter de la cohérence visuelle à un ensemble de fonctions sans lien apparent.\n',
                          style: fontStyle),
                      TextSpan(text: 'Ce composant peut etre '),
                      TextSpan(
                          text:
                              'décliné avec les autres couleurs du nuancier BYCN ',
                          style: fontStyle),
                      TextSpan(
                          text: 'et être disposé sur une même page.\n'
                              'La sélection des couleurs et des icônes (choix de la couleur en cas de monochrome ou des couleurs multilples) dépendra de l’application.')
                    ],
                  ),
                ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Buttons"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "FLAT",
              ),
              Tab(text: "Outline"),
              Tab(text: "Text"),
              Tab(text: "Toggle"),
              Tab(text: "Hub"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            getFlatButtonDemo(),
            getOutlineButtonDemo(),
            geTextButtonDemo(),
            getToggleButtonDemo(),
            getHubButtonDemo()
          ],
        ),
      ),
    ));
  }
}
