import 'dart:convert';

class MovieList {
  List<Movie> getAllMovies(response) {
    List<Movie> _movieList = List<Movie>();
    var results = json.decode(response)['results'];

    for (Map<String, dynamic> result in results) {
      Movie _movie = Movie(result);

      _movieList.add(_movie);
    }

    return _movieList;
  }
}

class Movie {
  int id;
  String posterPath;
  String title;
  String description;
  String releaseDate;
  int averageVote;
  int voteCount;

  Movie(result) {
    id = result['id'];
    posterPath = result['poster_path'];
    title = result['title'];
    releaseDate = result['release_date'];
    averageVote = result['average_vote'];
    voteCount = result['vote_count'];
  }
}
