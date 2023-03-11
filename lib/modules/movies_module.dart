import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/generated/pigeon.dart';
import 'package:instabug_flutter_task/models/api_response.dart';
import 'package:instabug_flutter_task/models/movie.dart';
import 'package:instabug_flutter_task/utils/api_links.dart';

//This class is a singleton class to handle the movies module
//It is responsible for fetching movies from the API
//and storing them in a list of movies to be used in the app.
class MoviesModule {

  MoviesModule._internal();

  static final MoviesModule instance = MoviesModule._internal();

  final List<Movie> movies = [];

  Future<List<Movie>> getMovies() async {
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

  Future<void> onRefresh() async {
    movies.clear();
    await getMovies();
  }

  void clearMovies() {
    movies.clear();
  }
}
