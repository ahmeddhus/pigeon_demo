import 'package:instabug_flutter_task/models/movie.dart';
import 'package:instabug_flutter_task/modules/movies_module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

//Generated by the riverpod annotation package to generate the provider
part 'movies_view_model.g.dart';

//annotation to generate the provider
//This provider is used to fetch the movies from the API
//To generate the provider run the command: flutter pub run build_runner build
//To watch for changes and generate the provider run the command: flutter pub run build_runner watch
//To generate the provider for all the files run the command: flutter pub run build_runner build --delete-conflicting-outputs
@riverpod
Future<List<Movie>> getMovies(GetMoviesRef ref) async {
  return MoviesModule.instance.getMovies();
}
