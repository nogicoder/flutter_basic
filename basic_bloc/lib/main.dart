import 'package:flutter/material.dart';
import 'package:holding_gesture/holding_gesture.dart';

// Import the BLoC
import 'package:basic_bloc/bloc.dart';

// Run App
void main() => runApp(Counter());

// App Configuration

/// The title of the app. Change appTitle will change the text on top of the screen.
String appTitle = "Basic Counter App";

/// Initial value of the counter. Set new starting value will change the initial number in the middle of the Screen.
int initialCounterValue = 0;

/// Initial color of the background. Set new value will cause the app to change the background color.
Color initialBackgroundColor = Colors.blueGrey;

// App Widgets

/// This widget render the whole app interface using MaterialApp widget.
class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Counter App",
        theme: ThemeData(
            primaryColor: Colors.brown[900],
            primaryTextTheme: Typography().white,
            textTheme: Typography().white),
        home: CounterWidget(
            title: appTitle,
            initialCounter: initialCounterValue,
            initialColor: initialBackgroundColor));
  }
}

/// This widget hold a State widget that render the main section of the app.
class CounterWidget extends StatefulWidget {
  final String title;
  final int initialCounter;
  final Color initialColor;

  CounterWidget({this.title, this.initialCounter, this.initialColor});

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

/// The State class of CounterWidget. Renders the Counter UI consists of counter value, background color and the plus/minus button.
/// The State is managed by a Business Logic Component (CounterBloc). The CounterBloc provides a Stream object which is passed into the StreamBuilder widget.
/// for listening to the State changes and update the UI accordingly.
class _CounterWidgetState extends State<CounterWidget> {
  CounterBloc _bloc = CounterBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  /// This function return a Container widget composed of a Text and the Counter Value to be rendered later in the build method of the class.
  /// @param data: Value of snapshot.data in which snapshot is an AsyncSnapshot object output from the Stream
  Widget displayCounter(data) {
    return Container(
        decoration: BoxDecoration(color: data[1]),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text("Waiting for Interraction", style: TextStyle(fontSize: 30)),
              Text("${data[0]}", style: TextStyle(fontSize: 50))
            ])));
  }

  /// This function return a Button to be rendered later in the build method of the class.
  /// @param icon: The icon to be displayed in the button. Should be Icons.add or Icons.remove
  /// @param action: The action to be taken when pressing the button. Should be a method of the BLoC (incrementCounter or decrementCounter)
  Widget createButton({icon, action}) {
    return HoldDetector(
        onHold: action,
        holdTimeout: Duration(milliseconds: 100),
        enableHapticFeedback: true,
        child: FloatingActionButton(
            backgroundColor: Colors.brown[800],
            child: Icon(icon),
            onPressed: action));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: StreamBuilder(
            initialData: [widget.initialCounter, widget.initialColor],
            stream: _bloc.getStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Text("Error getting data");
              }
              return displayCounter(snapshot.data);
            }),
        floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  createButton(icon: Icons.add, action: _bloc.incrementCounter),
                  SizedBox(height: 10),
                  createButton(
                      icon: Icons.remove, action: _bloc.decrementCounter),
                ])));
  }
}
