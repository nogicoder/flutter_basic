// This is the Movie model initialized after the item in the movie list fetched from the API
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
    description = result['overview'];
    releaseDate = result['release_date'];
    averageVote = result['average_vote'];
    voteCount = result['vote_count'];
  }
}
