import 'dart:convert';
import 'package:flutter/material.dart';

class MovieList {
  List<Movie> movieList;
  String response;

  MovieList(response) {
    List<Movie> _temp;
    List<Map<String, dynamic>> results = json.decode(response)['results'];

    for (Map<String, dynamic> result in results) {
      _temp.add(Movie(result));
    }

    movieList = _temp;
  }
}

class Movie {
  Map<String, dynamic> result;
  int id;
  String posterPath;
  String title;
  String description;
  String releaseDate;
  int averageVote;
  int voteCount;

  Movie(this.result) {
    id = result['id'];
    posterPath = result['poster_path'];
    title = result['title'];
    releaseDate = result['release_date'];
    averageVote = result['average_vote'];
    voteCount = result['vote_count'];
  }
}
