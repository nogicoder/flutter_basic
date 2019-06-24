import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

import 'package:movie_browser/src/bloc/movie_list_bloc.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void didChangeDependencies() {
    // TODO: Add listener of PublishSubject from movie_list_bloc
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose method of movie_list_bloc
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Most Popular Movies", style: TextStyle(fontSize: 30))),
      body: StreamBuilder(
        stream: //TODO Input the Observable object from movie_list_bloc
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return //TODO Implement UI for MovieList using nextState from snapshot.data
          ;
        }
      )
    );
  }
}
