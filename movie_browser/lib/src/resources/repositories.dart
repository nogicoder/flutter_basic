import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_browser/src/model/movie_model.dart';

const _url = "https://api.themoviedb.org/3/trending/movie/day";
const apiKey = "8ccaa3d1588b1fa8664016f14b0eda64";

class Repository {

  Future<MovieList> fetchMovie() async {
    final response = await get("$_url?page=1&api_key=$apiKey");

    if (response.statusCode == 200) {
      return MovieList(response.body);
    }
    throw Exception('Failed loading movie');
  }
}
