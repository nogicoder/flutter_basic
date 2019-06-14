import 'package:flutter/material.dart';
import 'package:uikit_bycn/interactive_elements/uikitdialog.dart';
import 'package:uikit_bycn/buttons/uikitbutton.dart';
import 'package:uikit_bycn/interactive_elements/banner/uikitbanner.dart';
import 'package:uikit_bycn_example/routes.dart';
import 'package:uikit_bycn/interactive_elements/uikitloading/uikitloadingcircular.dart';
import 'package:uikit_bycn/interactive_elements/uikitloading/uikitloadinglinear.dart';
import 'package:uikit_bycn/interactive_elements/uikitavatar.dart';
import 'dart:async';
import 'dart:math';

const fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);

class DialogDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: <Widget>[
          UIKitButton(
              buttonType: UIKITBUTTONTYPE.FLAT,
              label: "Dialog",
              onPressed: () {
                UIKitDialog.show(
                    context: context,
                    title: Text("Title"),
                    content: Text("Content"),
                    onPressedOK: () {
                      Navigator.of(context).pop();
                      final snackBar = SnackBar(
                        content: Text('Dialog Action - OK'),
                        duration: Duration(seconds: 1),
                      );

                      // Find the Scaffold in the Widget tree and use it to show a SnackBar!
                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                    onPressedCancel: () {
                      Navigator.of(context).pop();
                      final snackBar = SnackBar(
                        content: Text('Dialog Action - Cancel'),
                        duration: Duration(seconds: 1),
                      );

                      // Find the Scaffold in the Widget tree and use it to show a SnackBar!
                      Scaffold.of(context).showSnackBar(snackBar);
                    });
              }),
          Container(
              padding: EdgeInsets.all(20.0),
              child: RichText(
                text: TextSpan(
                  text: '',
                  style: fontStyle.copyWith(fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                    TextSpan(text: 'Bonnes pratiques\n', style: fontStyle),
                    TextSpan(text: 'Les boîtes de dialogue '),
                    TextSpan(
                      text: 'informent les utilisateurs sur une tâche, ',
                      style: fontStyle,
                    ),
                    TextSpan(
                        text:
                            'elles peuvent contenir des informations critiques, elles sont la '),
                    TextSpan(
                        text:
                            'pour forcer l’utilisateur à prendre une décision.\n',
                        style: fontStyle),
                    TextSpan(text: 'La popup ou boîte de dialogue, '),
                    TextSpan(
                        text: 'apparait toujours par dessus le contenu, ',
                        style: fontStyle),
                    TextSpan(
                      text: 'c’est une fenêtre dite « modale ».\n',
                    ),
                    TextSpan(
                        text:
                            'La boite de dialogue est disposé sur un fond noir transparent, de manière à laisser entrevoir le contenu, pour montrer que l’on a pas changé d’écran, et garder le lien entre l’action demandé et le contenu.\n'
                            'Cette manière de communiquer '),
                    TextSpan(
                        text: 'doit être utilisé avec parcimonie, ',
                        style: fontStyle),
                    TextSpan(
                        text: 'de part son aspect obligatoire et interruptif.')
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}

class BannerDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int i = 1;
    //
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        UIKitButton(
            label: "Top Banner",
            buttonType: UIKITBUTTONTYPE.FLAT,
            onPressed: () {
              UIKitBanner(
                duration: Duration(seconds: 2),
                bannerPosition: UIKitBannerPosition.TOP,
                body: Container(
                    child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.warning,
                      color: Color(0xFFE75113),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text("Aucune connexion internet"))
                  ],
                )),
              )..show(context);
              i++;
            }),
        UIKitButton(
            label: "Bottom Banner simple action",
            buttonType: UIKITBUTTONTYPE.FLAT,
            onPressed: () {
              UIKitBanner(
                message: "Message" + i.toString(),
                onPressedOK: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text("Banner Action"),
                          content: Text("Pressed OK"),
                        );
                      });
                },
              )..show(context);
              i++;
            }),
        UIKitButton(
            label: "Bottom Banner multiple action",
            buttonType: UIKITBUTTONTYPE.FLAT,
            onPressed: () {
              UIKitBanner(
                isDismissible: false,
                message: "Message" + i.toString(),
                onPressedOK: () {
                  print("OK");
                  showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text("Banner Action"),
                          content: Text("Pressed OK"),
                        );
                      });
                },
                onPressedCancel: () {
                  print("Cancel");
                  showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text("Banner Action"),
                          content: Text("Pressed Cancel"),
                        );
                      });
                },
              )..show(context);
            }),
        UIKitButton(
            label: "Close All Banners",
            buttonType: UIKITBUTTONTYPE.FLAT,
            onPressed: () {
              Navigator.of(context).popUntil((route) {
                return route.settings.name == RouteName.INTERACTIVE_ELEMENT;
              });
            }),
        Container(
            padding: EdgeInsets.all(20.0),
            child: RichText(
              text: TextSpan(
                text: '',
                style: fontStyle.copyWith(fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(text: 'Bonnes pratiques\n', style: fontStyle),
                  TextSpan(text: 'Une bannière peut '),
                  TextSpan(
                    text:
                        'afficher un message important et les actions facultatives associées.\n',
                    style: fontStyle,
                  ),
                  TextSpan(
                      text:
                          ' Elle peut afficher une question qui nécéssite un choix simple pour l’utilisateur, non intrusive, si la question nécessite une action obligatoire, il faudra utiliser une boite de dialogue / popup.\n'),
                  TextSpan(
                    text:
                        'Le style de bouton à utiliser sera le bouton tertiaire, le but étant de ne pas donner trop d’importance a cette action simple.\n'
                        'Dans le cas ou la question de la bannière, nécéssite un choix entre deux réponses courtes, le style des boutons sera identiques, bouton tertiaire, pour les deux choix.',
                  ),
                ],
              ),
            ))
      ],
    ));
  }
}

class LoadingDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingDemoWidgetState();
}

class _LoadingDemoWidgetState extends State<LoadingDemoWidget> {
  Timer _timer;
  double percent = 0.0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (percent == 1.0) {
                percent = 0.0;
                return;
              }

              Random random = new Random();
              percent += random.nextDouble() / 10;
              if (percent > 1.0) percent = 1.0;
            }));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    //
    return SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              UIKitLoadingCircular(
                radius: 120.0,
                animateFromLastPercent: true,
                animation: true,
                percent: percent,
                percentText: "${(percent * 100).toStringAsFixed(2)}%",
                detail: "Chargement de composant 1",
              ),
              UIKitLoadingCircular(
                radius: 120.0,
                animation: true,
                percent: 0.45,
                percentText: "Erreur",
                detail: "Chargement de composant 1",
                isError: true,
              )
            ],
          ),
          UIKitLoadingLinear(
            percent: percent,
            percentText: "${(percent * 100).toStringAsFixed(2)}%",
            animation: true,
            animateFromLastPercent: true,
          ),
          UIKitLoadingLinear(
            animation: true,
            isError: true,
            percent: 1,
            percentText: "Erreur",
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
                            'La barre linéaire est plus simple donc plus légère à implementer. La version circulaire permet d’afficher une ligne supplémentaire pour informer les utilisateurs des élements en cours de chargement.\n'
                            'Le choix du modèle est dévolu au designer.'),
                    TextSpan(
                      text:
                          'Les élements de chargements sont généralement postionnées au centre de l’écran mais, dans un soucie d’esthétique, elles peuvent etre positionné dans la zone des deux tiers bas ou haut.\n'
                          'En revanche, l’élement de chargement est normalement centré horizontalement.',
                    ),
                  ],
                ),
              ))
        ]));
  }
}

class CircleAvatarDemo extends StatelessWidget {
  handlePress(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("handle action"),
          );
        });
  }

  Widget renderSmallSize(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        UIKitAvatar(
            size: UIKitAvatarSize.SMALL,
            onPressed: () {
              handlePress(context);
            }),
        UIKitAvatar(
            size: UIKitAvatarSize.SMALL,
            titlePlaceHolder: "Ajouter",
            onPressed: () {
              handlePress(context);
            }),
        UIKitAvatar(
            size: UIKitAvatarSize.SMALL,
            usingDefaultAvatar: true,
            onPressed: () {
              handlePress(context);
            }),
        UIKitAvatar(
            size: UIKitAvatarSize.SMALL,
            titlePlaceHolder: "Ajouter",
            title: "Alice Morel",
            subTitle: "BYCN IT",
            image: AssetImage("assets/images/user_morel.png"),
            onPressed: () {
              handlePress(context);
            }),
        UIKitAvatar(
            size: UIKitAvatarSize.SMALL,
            titlePlaceHolder: "Ajouter",
            title: "Maxime A.",
            subTitle: "BYBAT IdF",
            onPressed: () {
              handlePress(context);
            }),
        UIKitAvatar(
            size: UIKitAvatarSize.SMALL,
            title: "François L.",
            subTitle: "External",
            avatarStyle: UIKitAvatarStyle.SUBTITLE,
            onPressed: () {
              handlePress(context);
            }),
      ],
    );
  }

  Widget renderMediumSize(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    UIKitAvatar(
                        size: UIKitAvatarSize.MEDIUM,
                        onPressed: () {
                          handlePress(context);
                        }),
                    UIKitAvatar(
                        size: UIKitAvatarSize.MEDIUM,
                        titlePlaceHolder: "Ajouter",
                        onPressed: () {
                          handlePress(context);
                        }),
                    UIKitAvatar(
                        size: UIKitAvatarSize.MEDIUM,
                        usingDefaultAvatar: true,
                        onPressed: () {
                          handlePress(context);
                        }),
                  ],
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                UIKitAvatar(
                    size: UIKitAvatarSize.MEDIUM,
                    titlePlaceHolder: "Ajouter",
                    title: "Alice Morel",
                    subTitle: "BYCN IT",
                    image: AssetImage("assets/images/user_morel.png"),
                    onPressed: () {
                      handlePress(context);
                    }),
                UIKitAvatar(
                    size: UIKitAvatarSize.MEDIUM,
                    titlePlaceHolder: "Ajouter",
                    title: "Maxime A.",
                    subTitle: "BYBAT IdF",
                    onPressed: () {
                      handlePress(context);
                    }),
                UIKitAvatar(
                    size: UIKitAvatarSize.MEDIUM,
                    title: "François L.",
                    subTitle: "External",
                    avatarStyle: UIKitAvatarStyle.SUBTITLE,
                    onPressed: () {
                      handlePress(context);
                    }),
              ],
            )
          ],
        ));
  }

  Widget renderLargeSize(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            UIKitAvatar(
                size: UIKitAvatarSize.LARGE,
                usingDefaultAvatar: true,
                onPressed: () {
                  handlePress(context);
                }),
            UIKitAvatar(
                size: UIKitAvatarSize.LARGE,
                titlePlaceHolder: "Ajouter",
                title: "Alice Morel",
                subTitle: "BYCN IT",
                image: AssetImage("assets/images/user_morel.png"),
                onPressed: () {
                  handlePress(context);
                }),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            UIKitAvatar(
                size: UIKitAvatarSize.LARGE,
                titlePlaceHolder: "Ajouter",
                title: "Maxime A.",
                subTitle: "BYBAT IdF",
                onPressed: () {
                  handlePress(context);
                }),
            UIKitAvatar(
                size: UIKitAvatarSize.LARGE,
                title: "François L.",
                subTitle: "External",
                avatarStyle: UIKitAvatarStyle.SUBTITLE,
                onPressed: () {
                  handlePress(context);
                }),
          ],
        )
      ],
    );
  }

  Widget renderGoodPractices() {
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
                      'Le composant Profil utilisateur(s) est un élement qui '),
              TextSpan(
                text:
                    'nécessite la présence d’une pop-up de recherche ou une liste de sélection.\n',
                style: fontStyle,
              ),
              TextSpan(text: ' Il apparait vide par défaut et permet de '),
              TextSpan(
                  text: 'manipuler une personne ou un groupe de personne ',
                  style: fontStyle),
              TextSpan(
                  text:
                      'pour une assignation de tâche par exemple. Il est alors répétable et la possibilité d’ajout reste accessible.\n'),
              TextSpan(text: 'Ce composant est aussi utilisé pour '),
              TextSpan(
                  text:
                      'expliciter l’identité de l’utilisateur d’une application ou d’un Post par exemple.\n',
                  style: fontStyle),
              TextSpan(text: ' Le '),
              TextSpan(
                  text: 'nom de la personne est totalement optionnel ',
                  style: fontStyle),
              TextSpan(text: 'en fonction de l’usage fait du composant.')
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    //
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          renderSmallSize(context),
          renderMediumSize(context),
          renderLargeSize(context),
          renderGoodPractices()
        ],
      ),
    ));
  }
}

class InteractiveElementDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return Container(
        child: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Interactive Element"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Dialog"),
              Tab(text: "Banner"),
              Tab(text: "Loading"),
              Tab(text: "Avatar")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DialogDemoWidget(),
            BannerDemoWidget(),
            LoadingDemoWidget(),
            CircleAvatarDemo()
          ],
        ),
      ),
    ));
  }
}
