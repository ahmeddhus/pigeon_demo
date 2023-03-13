import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instabug_flutter_task/models/api_response.dart';
import 'package:instabug_flutter_task/models/movie.dart';
import 'package:instabug_flutter_task/modules/movies_module.dart';

///This is the provider that will be used to access the movies module
///It will be used in the home page to fetch the movies inside [HomePageRiverpod]
final moviesModuleProvider = ChangeNotifierProvider<MoviesViewModel>((ref) {
  return MoviesViewModel();
});

class MoviesViewModel extends ChangeNotifier {
  late MoviesModule moviesModule;

  MoviesViewModel() {
    moviesModule = MoviesModule();

    ///To fetch the movies from the API when the provider is initialized
    getMovies();
  }

  /// To get the movies list from [moviesModule]
  List<Movie> get movies => moviesModule.movies;

  /// This boolean determine if the loading indicator should be shown or not
  bool isLoading = true;

  /// To fetch the movies from the API
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

  /// To refresh the movies list by clearing the list and fetching the movies again
  Future<void> onRefresh() async {
    toggleLoading(on: true);
    await moviesModule.onRefresh();
    toggleLoading(on: false);
  }

  /// To toggle the loading state by setting [isLoading] to [on]
  /// And update the UI
  void toggleLoading({bool on = false}) {
    isLoading = on;
    notifyListeners();
  }
}
