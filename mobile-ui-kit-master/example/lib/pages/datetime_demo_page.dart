import 'package:flutter/material.dart';
import 'package:uikit_bycn/interactive_elements/datetime/uikitdatepicker.dart';
import 'package:uikit_bycn/interactive_elements/datetime/uikittimepicker.dart';
import 'package:uikit_bycn/buttons/uikitbutton.dart';
import 'package:intl/intl.dart';
import 'package:uikit_bycn/interactive_elements/datetime/uikitdatetimeselector.dart';
import 'package:uikit_bycn/selection_control/uikitswitch.dart';

var fontStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);

class TimePickerDemo extends StatefulWidget {
  @override
  State<TimePickerDemo> createState() => _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {
  int selectedHour = 0;
  int selectedMinute = 0;

  Widget renderGoodPractice() {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: RichText(
          text: TextSpan(
            text: '',
            style: fontStyle.copyWith(fontWeight: FontWeight.normal),
            children: <TextSpan>[
              TextSpan(text: 'Bonnes pratiques\n\n', style: fontStyle),
              TextSpan(
                  text: 'Ce composant permet de sélectionner des heures sur '),
              TextSpan(
                text: 'un mode de roulette à pousser.\n',
                style: fontStyle,
              ),
              TextSpan(
                text:
                    'En fonction du paramétrage et du niveau de finesse souhaité, nous pouvons avoir l’ensemble des heures et minutes ou ',
              ),
              TextSpan(text: 'des tranches horaires ', style: fontStyle),
              TextSpan(
                text: '(30min par exemple) dans la roulette.\n',
              ),
              TextSpan(text: 'Les '),
              TextSpan(
                  text: 'heures sont à gauche et les minutes à droite.\n',
                  style: fontStyle),
              TextSpan(
                text: 'Ce composant ',
              ),
              TextSpan(
                text: 's’affiche toujours en pop-in sur fond gris transparent ',
                style: fontStyle,
              ),
              TextSpan(
                text: 'laissant entrevoir l’application.\n\n',
              ),
              TextSpan(text: 'Il y a '),
              TextSpan(text: 'deux possiblités de quitter ', style: fontStyle),
              TextSpan(
                  text:
                      ' : soit en faisant OK (bouton primaire) pour enregristrer l’heure entrée, soit en fermant grâce à la croix en haut à droite qui n’enregistrera pas l’heure et reviendra à la valeur par défault.')
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    String hourString = selectedHour >= 10
        ? selectedHour.toString()
        : "0" + selectedHour.toString();
    String minuteString = selectedMinute >= 10
        ? selectedMinute.toString()
        : "0" + selectedMinute.toString();
    return SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Selected: $hourString : $minuteString"),
            UIKitButton(
              buttonType: UIKITBUTTONTYPE.FLAT,
              onPressed: () {
//              DatePicker.showTimePicker(context);
                UIKitTimePicker(
                  initHour: selectedHour,
                  initMinute: selectedMinute,
                  onPressedCancel: () {
                    print("CANCEL");
                  },
                  onPressedOK: (int hour, int minute) {
                    setState(() {
                      selectedHour = hour;
                      selectedMinute = minute;
                    });
                  },
                )..show(context);
              },
              label: "Show Time Picker",
            ),
            renderGoodPractice()
          ],
        ));
  }
}

class DateTimeSelectorDemo extends StatefulWidget {
  @override
  State<DateTimeSelectorDemo> createState() => _DateTimeSelectorDemoState();
}

class _DateTimeSelectorDemoState extends State<DateTimeSelectorDemo> {
  DateTime selectedDate;
  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  Widget renderGoodPractice() {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: RichText(
          text: TextSpan(
            text: '',
            style: fontStyle.copyWith(fontWeight: FontWeight.normal),
            children: <TextSpan>[
              TextSpan(text: 'Bonnes pratiques\n\n', style: fontStyle),
              TextSpan(text: 'Ce composant permet '),
              TextSpan(
                text: 'de lancer un selecteur d’une date et/ou d’une heure ',
                style: fontStyle,
              ),
              TextSpan(
                text: '(voir page suivante pour le calendrier et l’heure).\n\n',
              ),
              TextSpan(
                  text:
                      'Par défault, le composant n’affiche qu’une icone. A l’inverse, une fois la selection effectué, nous n’affichons que la date et/ou heure.\n'),
              TextSpan(
                text:
                    'Lorsque le composant dispose d’une date à afficher, une icone “croix” apparait en haut à droite pour ',
              ),
              TextSpan(
                  text:
                      'supprimer les informations et repartir rapidement aux valeurs par défault.\n\n',
                  style: fontStyle),
              TextSpan(
                text: 'Le positionnnement et généralement en haut ',
              ),
              TextSpan(
                text:
                    'ce composant peut etre doublé pour définir, par exemple, une date de début et une date de fin.',
                style: fontStyle,
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: UIKitDateTimeSelector(
                    enabled: false,
                    firstDate: DateTime.now().add(Duration(days: -100)),
                    lastDate: DateTime.now().add(Duration(days: 100)),
                  )),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: UIKitDateTimeSelector(
                    firstDate: DateTime.now().add(Duration(days: -100)),
                    lastDate: DateTime.now().add(Duration(days: 100)),
                  ))
            ],
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: UIKitDateTimeSelector(
                type: UIKitDateTimeSelectorType.DATE,
                firstDate: DateTime.now().add(Duration(days: -100)),
                lastDate: DateTime.now().add(Duration(days: 100)),
              )),
          renderGoodPractice()
        ],
      )),
    );
  }
}

class DatePickerDemo extends StatefulWidget {
  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime selectedDate;
  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  Widget renderGoodPractice() {
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
                      'Le calendrier pourra etre utilisé dans plusieurs situations : en '),
              TextSpan(
                text: 'pop-in au clique sur un selecteur de date ',
                style: fontStyle,
              ),
              TextSpan(
                text: 'par exemple ou ',
              ),
              TextSpan(text: 'en direct sur l’application ', style: fontStyle),
              TextSpan(
                text:
                    'dans le cas ou la date est une composante essentiel de la navigation.\n'
                    'Dans le cas d’une présentation en pop-in, il faudra que le calendrier soit ',
              ),
              TextSpan(
                  text: 'affiché sur un fond gris foncé ', style: fontStyle),
              TextSpan(
                text: 'avec l’application estompé en arrière-plan.\n',
              ),
              TextSpan(
                text:
                    'La variantion entre les deux versions proposées permet soit ',
              ),
              TextSpan(
                text:
                    'de naviguer horizontalement (swipe droit/gauche) soit verticallement (scroll haut/bas) ',
                style: fontStyle,
              ),
              TextSpan(
                text: 'pour faire défiler les mois.\n\n'
                    'La ',
              ),
              TextSpan(
                text:
                    'selection de la date est marqué par un cercle orange (#E75113) ',
                style: fontStyle,
              ),
              TextSpan(
                  text:
                      'qui apparait soit au clique pour une pop-in, soit en permanence.')
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Text("Selected: ${DateFormat("dd/MM/yyyy").format(selectedDate)}"),
          UIKitButton(
              label: "Show Calendar Horizontal",
              buttonType: UIKITBUTTONTYPE.FLAT,
              onPressed: () {
                showUIKitDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: selectedDate.add(Duration(days: -100)),
                        lastDate: selectedDate.add(Duration(days: 100)))
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      selectedDate = value;
                    });
                  }
                });
              }),
          UIKitButton(
              label: "Show Calendar Vertical",
              buttonType: UIKITBUTTONTYPE.FLAT,
              onPressed: () {
                showUIKitDatePicker(
                        isVertical: true,
                        context: context,
                        initialDate: selectedDate,
                        firstDate: selectedDate.add(Duration(days: -100)),
                        lastDate: selectedDate.add(Duration(days: 100)))
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      selectedDate = value;
                    });
                  }
                });
              }),
          renderGoodPractice()
        ],
      )),
    );
  }
}

class CalendarDemo extends StatefulWidget {
  @override
  State<CalendarDemo> createState() => _CalendarDemoState();
}

class _CalendarDemoState extends State<CalendarDemo> {
  DateTime selectedDate;
  bool isVertical = false;
  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          UIKitSwitch(
            label: "Vertical",
            value: isVertical,
            onChanged: (onValue) {
              setState(() {
                isVertical = onValue;
              });
            },
          ),
          UIKitDatePicker(
              isVertical: isVertical,
              selectedDate: DateTime.now(),
              onChanged: (dt) {},
              firstDate: DateTime.now().add(Duration(days: -200)),
              lastDate: DateTime.now().add(Duration(days: 200)))
        ],
      )),
    );
  }
}

class DateVerticalDemo extends StatefulWidget {
  @override
  State<DateVerticalDemo> createState() => _DateVerticalDemoState();
}

class _DateVerticalDemoState extends State<DateVerticalDemo> {
  DateTime selectedDate;
  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          child: UIKitDatePicker(
              isVertical: true,
              selectedDate: DateTime(2019, 1, 8),
              onChanged: (dt) {},
              firstDate: DateTime(2019, 1, 1),
              lastDate: DateTime(2019, 2, 20))),
    );
  }
}

class DateTimeDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return Container(
        child: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Date Time"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Date Time Selection"),
              Tab(text: "Time Picker"),
              Tab(text: "Date Picker"),
              Tab(text: "Calendar"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DateTimeSelectorDemo(),
            TimePickerDemo(),
            DatePickerDemo(),
            CalendarDemo(),
          ],
        ),
      ),
    ));
  }
}
