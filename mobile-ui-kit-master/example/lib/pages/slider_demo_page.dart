import 'package:flutter/material.dart';
import 'package:uikit_bycn/selection_control/uikitslider.dart';
import 'package:uikit_bycn/header/uikitheader.dart';

class SliderDemoPage extends StatefulWidget {
  SliderDemoPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SliderDemoState();
}

class SliderDemoState extends State<SliderDemoPage> {
  var fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);

  Widget renderSliderGoodPractice() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: RichText(
        text: TextSpan(
          text: '',
          style: fontStyle.copyWith(fontWeight: FontWeight.normal),
          children: <TextSpan>[
            TextSpan(text: 'Bonnes pratiques\n\n', style: fontStyle),
            TextSpan(text: 'Le slider est un « selection controls »,'),
            TextSpan(
              text:
                  ' qui permet de filtrer ou restreindre une selection d’élements. ',
              style: fontStyle,
            ),
            TextSpan(
                text:
                    'Par défaut, il n’a aucune action sur la sélection mais le curseur peut etre déplacé pour agir sur les élements concernée.  Il n’a de sens que lorsque du contenu en grand nombre est présent.\n\n'),
            TextSpan(
                text:
                    'Les styles de réglettes peuvent etre utilisées en cumulé dans le cas d’écran de filtrage avancé mais elles doivent '),
            TextSpan(
              text:
                  'toujours être renseigné par un texte décrivant l’element de filtrage ',
              style: fontStyle,
            ),
            TextSpan(text: 'que le bouton active ou désactive.'),
          ],
        ),
      ),
    );
  }

  getSliderDemo() {
    return SingleChildScrollView(
        child: Center(
            child: Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  'Single endpoint slider',
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
                margin: EdgeInsets.only(top: 20.0),
                child: Center(
                  child: UIKitSlider(
                    max: 100,
                    values: [50],
                    onChanged: (List<double> values) {},
                  ),
                )),
          )
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: UIKitSlider(
                  max: 100,
                  values: [50],
                  onChanged: null,
                ),
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  'Range slider',
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
                margin: EdgeInsets.only(top: 20.0),
                child: Center(
                  child: UIKitSlider(
                    max: 100,
                    values: [25, 75],
                    onChanged: (List<double> values) {},
                  ),
                )),
          )
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  'Multiple endpoints slider',
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
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: UIKitSlider(
                  max: 500,
                  values: [50, 100, 400],
                  onChanged: (List<double> values) {},
                ),
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
      renderSliderGoodPractice()
    ])));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: UIKitHeader(
          title: Text('Slider'),
        ),
        body: getSliderDemo(),
      ),
    );
  }
}
