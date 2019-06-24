import 'package:flutter/material.dart';
import 'package:movie_browser/src/ui/movie_list.dart';

class MovieBrowser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movie Browser",
        theme: ThemeData(
            primaryColor: Colors.blueGrey[900],
            scaffoldBackgroundColor: Colors.black,
            textTheme:
                TextTheme(body1: TextStyle(color: Colors.blueAccent[800]))),
        home: MovieList());
  }
}
