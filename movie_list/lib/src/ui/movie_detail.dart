import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:movie_browser/src/model/movie_model.dart';
import 'package:movie_browser/src/bloc/movie_detail_bloc.dart';

class MovieDetail extends StatefulWidget {
  final Movie data;

  MovieDetail(this.data);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  MovieDetailBloc _bloc = MovieDetailBloc();

  Widget displayMovieDetail(context, data, trailerURL) {
    String _url = "http://youtube.com/watch?v=$trailerURL";

    Widget _asset = Image.network(
      "https://image.tmdb.org/t/p/w185${data.posterPath}",
      fit: BoxFit.cover,
    );

    return Scaffold(
        appBar: AppBar(
            title: Text("${data.title} (${data.releaseDate.substring(0, 4)})",
                style: Theme.of(context).textTheme.title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _asset,
            Divider(color: Colors.white, height: 20.0),
            Padding(padding: EdgeInsets.all(10.0), child: Text("ABOUT")),
            Center(child: Text("${data.description}",
                style: Theme.of(context).textTheme.body1)),
            SizedBox(height: 40),
            FlatButton(
                color: Colors.red,
                child: Text("Watch Trailer"),
                onPressed: () async {
                  if (trailerURL == null || !await canLaunch(_url)) {
                    throw 'Could not launch $_url';
                  } else {
                    await launch(_url);
                  }
                })
          ],
        ));
  }

  @override
  void initState() {
    _bloc.fetchTrailer(widget.data.id);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.movieStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return displayMovieDetail(context, widget.data, snapshot.data);
        });
  }
}
