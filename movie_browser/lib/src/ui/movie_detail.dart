import 'package:flutter/material.dart';
import 'package:movie_browser/src/model/movie_model.dart';

class MovieDetail extends StatelessWidget {
  Movie data;

  MovieDetail(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(data.title))),
      body: 
    );
  }
}
