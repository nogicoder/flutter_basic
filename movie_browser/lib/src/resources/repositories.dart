import 'package:http/http.dart';
import 'package:movie_browser/src/model/movie_model.dart';

class Repository {

  final String _url;

  Repository(this._url);

  MovieList _movieList = MovieList();

  Future<List<Movie>> fetchMovie() async {
    
    final response = await get("$_url&page=1");

    if (response.statusCode == 200) {
      return _movieList.getAllMovies(response.body);
    }
    throw Exception('Failed loading movie');
  }
}
