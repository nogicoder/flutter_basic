import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:movie_browser/src/model/movie_model.dart';
import 'package:movie_browser/src/bloc/movie_detail_bloc.dart';

// String _apiKey = "AIzaSyAO-rKU7DRN1tinzeXNKgiknhVMuqU_blY";
// String _url = "http://youtube.com/watch?v=";

class MovieDetail extends StatefulWidget {
  final Movie data;

  MovieDetail(this.data);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  MovieDetailBloc _bloc = MovieDetailBloc();

  // _launchURL() async {
  //   const url = 'https://flutter.io';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Widget displayMovieDetail(context, data, trailerURL) {
    print(trailerURL);

    Widget _asset = Image.network(
      "https://image.tmdb.org/t/p/w185${data.posterPath}",
      fit: BoxFit.cover,
    );

    return Scaffold(
        appBar: AppBar(
            title: Text("${data.title} (${data.releaseDate.substring(0, 4)})",
                style: Theme.of(context).textTheme.title)),
        body: Column(
          children: <Widget>[
            _asset,
            Divider(color: Colors.cyan[300], height: 20.0),
            Text("${data.description}",
                style: Theme.of(context).textTheme.body1),
            // FlatButton(child: Text("Watch Trailer"), onPressed: _launchURL)
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
