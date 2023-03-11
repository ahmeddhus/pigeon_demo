// This is the model class for the Movie object.
// It is used to parse the JSON response from the API.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/utils/from_map.dart';

class Movie {
  int? id;

  String? title;

  String? posterPath;

  DateTime? releaseDate;

  // The `overview` property defines the movie's description.
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

  // This method is used to parse the Map response from the API.
  //And convert it to Movie object
  factory Movie.fromMap(Map<String, dynamic> json) {
    // Create a FromMap object to convert the JSON response to the Movie object.
    final FromMap converter = FromMap(map: json);

    return Movie(
      id: converter.convertToInt(key: "id"),
      title: converter.convertToString(key: "title"),
      posterPath: converter.convertToString(key: "poster_path"),
      releaseDate: converter.convertToDate(key: "release_date"),
      overview: converter.convertToString(key: "overview"),
      voteAverage: converter.convertToDouble(key: "vote_average"),
    );
  }

  //Convert from json string to Movie object
  factory Movie.fromJsonString(String jsonString) {
    // Try to parse the JSON string.
    try {
      // Convert the JSON string to a Map.
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // Return an ApiResponse object.
      return Movie.fromMap(jsonMap);
    } catch (e) {
      // If there is an error, print it to the console.
      debugPrint('ApiResponse.fromJsonString: Error parsing JSON: $e');

      // Return an empty Movie object.
      return Movie();
    }
  }
}
