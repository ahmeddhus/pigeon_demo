// This is the model class for the Movie object.
// It is used to parse the JSON response from the API.
class Movie {
  int? id;

  String? title;

  String? posterPath;

  String? releaseDate;

  // The `overview` property defines the movie's description.
  String? overview;

  double? voteAverage;

  Movie({
    this.id,
    this.title,
    this.posterPath,
    this.releaseDate,
    this.overview,
    this.voteAverage,
  });

  // This method is used to parse the JSON response from the API.
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
    );
  }
}
