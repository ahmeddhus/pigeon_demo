import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instabug_flutter_task/models/api_response.dart';
import 'package:instabug_flutter_task/models/movie.dart';
import 'package:instabug_flutter_task/modules/movies_module.dart';

//This is the provider that will be used to access the movies module
//It will be used in the home page to fetch the movies inside [HomePageRiverpod]
final moviesModuleProvider = ChangeNotifierProvider<MoviesViewModel>((ref) {
  return MoviesViewModel();
});

class MoviesViewModel extends ChangeNotifier {
  late MoviesModule moviesModule;

  MoviesViewModel() {
    moviesModule = MoviesModule();
    getMovies();
  }

  List<Movie> get movies => moviesModule.movies;

  bool isLoading = true;

  Future<List<Movie>> getMovies() async {
    try {
      await moviesModule.getMovies();
    } on ApiResponse catch (apiResponse) {
      debugPrint('getMovies(): ${apiResponse.innerException} && ${apiResponse.statusMessage}');
    } catch (e) {
      debugPrint('getMovies(): $e');
    } finally {
      toggleLoading(on: false);
    }

    return movies;
  }

  Future<void> onRefresh() async {
    toggleLoading(on: true);
    await moviesModule.onRefresh();
    toggleLoading(on: false);
  }

  void toggleLoading({bool on = false}) {
    isLoading = on;
    notifyListeners();
  }
}
