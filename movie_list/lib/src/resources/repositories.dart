import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_browser/src/model/movie_model.dart';

const _apiKey = "8ccaa3d1588b1fa8664016f14b0eda64";
const _url = "https://api.themoviedb.org/3/trending/movie/day?api_key=$_apiKey";
const _trailerURL = "https://api.themoviedb.org/3/movie";

/// This class is the data handler, serves as a bridge between the Movie Database API and
/// the BLoC.
class Repository {
  /// This method return a list of movie from the response of the API call
  List<Movie> getAllMovies(response) {
    List<Movie> _movieList = List<Movie>();
    var results = json.decode(response)['results'];

    for (Map<String, dynamic> result in results) {
      Movie _movie = Movie(result);

      _movieList.add(_movie);
    }

    return _movieList;
  }

  /// This method use async/ await to fetch a list of movies from the Movie Database API
  Future<List<Movie>> fetchMovie() async {
    final response = await get("$_url&page=1");

    if (response.statusCode == 200) {
      return getAllMovies(response.body);
    }
    throw Exception('Failed loading movie');
  }

  /// This method use async/ await to fetch the trailer url of a movie based on its id
  Future<String> fetchTrailer(id) async {
    final response =
        await get("$_trailerURL/$id/videos?language=en-US&api_key=$_apiKey");

    if (response.statusCode == 200) {
      return json.decode(response.body)['results'][0]['key'];
    }
    throw Exception('Failed loading trailer');
  }
}
