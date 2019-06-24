import 'package:flutter/material.dart';

import 'package:movie_browser/src/bloc/movie_list_bloc.dart';
import 'package:movie_browser/src/ui/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieListBloc _bloc = MovieListBloc();

  showMovieDetail(context, movie) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => MovieDetail(movie))
    );
  }

  displayMovies(context, data) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        padding: const EdgeInsets.all(5.0),
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        children: List.generate(data.length, (index) {
          return GestureDetector(
            child: Image.network(
              "https://image.tmdb.org/t/p/w185${data[index].posterPath}",
              fit: BoxFit.cover,
            ),
            onTap: showMovieDetail(context, data[index])
          );
        }));
  }

  @override
  void initState() {
    _bloc.fetchAllMovies();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text("Most Popular Movies",
                    style: TextStyle(fontSize: 30)))),
        body: StreamBuilder(
            stream: _bloc.movieStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return displayMovies(context, snapshot.data);
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
