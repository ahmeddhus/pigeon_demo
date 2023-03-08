import 'package:pigeon/pigeon.dart';

class Movie {
  String? title;
  String? date;
}

@HostApi()
abstract class BookApi {
  @async
  List<Movie?> movies(int pageNumber);
}
