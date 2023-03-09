import 'package:pigeon/pigeon.dart';

class Movie {
  String? title;
  String? date;
}

@HostApi()
abstract class MoviesHostApi {
  List<Movie?> getMovies(int pageNumber);
}
