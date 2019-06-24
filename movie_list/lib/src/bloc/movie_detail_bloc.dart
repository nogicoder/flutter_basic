import 'package:rxdart/rxdart.dart';
import 'package:movie_browser/src/resources/repositories.dart';

// The BLoC of each movie's UI
class MovieDetailBloc {

  final _repository = Repository();
  final _controller = PublishSubject<String>();

  Observable<String> get movieStream => _controller.stream;

  fetchTrailer(id) async {
    String _trailerURL = await _repository.fetchTrailer(id);
    _controller.sink.add(_trailerURL);
  }

  void dispose() {
    _controller.close();
  }
}
