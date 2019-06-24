import 'package:rxdart/rxdart.dart';
import 'package:movie_browser/src/model/movie_model.dart';
import 'package:movie_browser/src/resources/repositories.dart';

const _apiKey = "8ccaa3d1588b1fa8664016f14b0eda64";
const _url = "https://api.themoviedb.org/3/trending/movie/day?api_key=$_apiKey";

class MovieListBloc {
  final _repository = Repository(_url);
  final _controller = PublishSubject<List<Movie>>();

  Observable<List<Movie>> get movieStream => _controller.stream;

  fetchAllMovies() async {
    List<Movie> movieList = await _repository.fetchMovie();

    _controller.sink.add(movieList);
  }

  void dispose() {
    _controller.close();
  }
}
