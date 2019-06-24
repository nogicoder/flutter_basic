import 'package:flutter/material.dart';
import 'package:movie_browser/src/ui/movie_list.dart';


/// This is the main Widget of the app.
/// This widget displays a MaterialApp and set basic configs for the child widgets
class MovieBrowser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movie Browser",
        theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.cyan,
          fontFamily: 'Montserrat',
          primaryColor: Colors.blueGrey[900],
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(
            title: TextStyle(fontSize: 25.0, color: Colors.yellowAccent[700]),
            body1: TextStyle(fontSize: 20.0, color: Colors.blue[400]))),
        home: MovieList());
  }
}
