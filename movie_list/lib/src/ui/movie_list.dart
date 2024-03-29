import 'package:flutter/material.dart';

import 'package:movie_browser/src/bloc/movie_list_bloc.dart';
import 'package:movie_browser/src/ui/movie_detail.dart';

/// This widget displays the main screen with a list of movie
class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieListBloc _bloc = MovieListBloc();

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent / 3 &&
        !_controller.position.outOfRange) {
      print("YEP END");
      _bloc.fetchAllMovies();
    }
  }

  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
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
                    style: Theme.of(context).textTheme.title)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_upward),
                onPressed: () {
                  _controller.animateTo(0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              )
            ]),
        body: StreamBuilder(
            stream: _bloc.movieStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                    controller: _controller,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    padding: const EdgeInsets.all(5.0),
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    children: List.generate(snapshot.data.length, (index) {
                      return GestureDetector(
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w185${snapshot.data[index].posterPath}",
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MovieDetail(snapshot.data[index])));
                          });
                    }));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
