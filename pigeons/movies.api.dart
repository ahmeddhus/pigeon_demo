import 'package:pigeon/pigeon.dart';

class Movie {
  String? title;
  String? date;
}

@HostApi()
abstract class MoviesApi {
  @async
  List<Movie?> movies(int pageNumber);
}
