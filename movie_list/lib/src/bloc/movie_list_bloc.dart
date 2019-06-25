import 'package:rxdart/rxdart.dart';
import 'package:movie_browser/src/model/movie_model.dart';
import 'package:movie_browser/src/resources/repositories.dart';

// This is the BLoC of the movie list's UI
class MovieListBloc {
  final _repository = Repository();
  final _controller = PublishSubject<List<Movie>>();
  int _counter = 0;

  Observable<List<Movie>> get movieStream => _controller.stream;

  fetchAllMovies() async {
    _counter++;
    List<Movie> movieList = await _repository.fetchMovie(_counter);

    _controller.sink.add(movieList);
  }

  void dispose() {
    _controller.close();
  }
}
