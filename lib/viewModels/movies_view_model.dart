import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/generated/pigeon.dart';
import 'package:instabug_flutter_task/models/api_response.dart';
import 'package:instabug_flutter_task/models/movie.dart';
import 'package:instabug_flutter_task/utils/api_links.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 2. add a part file
part 'movies_view_model.g.dart';

@riverpod
Future<List<Movie>> getMovies(GetMoviesRef ref) async {
  final List<Movie> movies = [];
  try {
    //Invoke the API to fetch movies from the API which is implemented in the native side
    dynamic response = await MoviesHostApi().getMovies('$moviesApiUrl$apiKey');

    //Check if the response is a string
    if (response is String) {
      ApiResponse apiResponse = ApiResponse.fromJsonString(response);

      //Check if the response is a list of maps
      if (apiResponse.results is List<Map>) {
        //Add the movies to the list
        movies.addAll(
            (apiResponse.results as List).map((itemWord) => Movie.fromMap(itemWord)).toList());
      }
    }
  } catch (e) {
    debugPrint('_getMovies(): $e');
  }
  return movies;
}
