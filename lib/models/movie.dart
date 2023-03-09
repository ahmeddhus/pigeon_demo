class Movie {
  int? id;
  String? title;
  String? posterPath;
  String? releaseDate;
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
