import 'package:pigeon/pigeon.dart';

class Movie {
  String? title;
  String? date;
}

@HostApi()
abstract class MoviesApi {
  List<Movie?> getMovies(int pageNumber);
}
