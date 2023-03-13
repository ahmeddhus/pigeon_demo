// This is a generic model class for the API response.
// It is used to parse the JSON response from the API.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/utils/from_map.dart';

class ApiResponse {

  /// Page number of the current response.
  final int? page;

  /// Total number of pages.
  final int? totalPages;

  /// Total number of results.
  final int? totalResults;

  /// The `results` property is dynamic because it can be a list of movies, a list of TV shows, etc.
  final dynamic results;

  final List<Map<String, dynamic>>? listResults;

  /// The `statusCode` property is used to store the status code in case of an error.
  final int? statusCode;

  /// The `success` property is used to store the success status in case of an error.
  final bool? success;

  /// The `statusMessage` property is used to store the error message in case of an error.
  final String? statusMessage;

  /// The `innerException` property is used to store the inner exception in case of an error.
  //only used for debugging.
  final String? innerException;

  ApiResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
    this.listResults,
    this.statusCode,
    this.statusMessage,
    this.success,
    this.innerException,
  });

  /// This method is used to parse the Map response from the API.
  /// And convert it to ApiResponse object
  factory ApiResponse.fromMap(Map<String, dynamic> json) {
    /// Create a FromMap object to convert the JSON response to the Movie object.
    final FromMap converter = FromMap(map: json);

    return ApiResponse(
      page: converter.convertToInt(key: "page"),
      totalPages: converter.convertToInt(key: "total_pages"),
      totalResults: converter.convertToInt(key: "total_results"),
      results: json["results"],
      listResults: converter.convertToList(key: "results"),
      statusMessage: converter.convertToString(key: "status_message"),
      statusCode: converter.convertToInt(key: "status_code"),
      success: converter.convertToBool(key: "success"),
    );
  }

  ///Convert from json string to ApiResponse object
  factory ApiResponse.fromJsonString(String? jsonString) {
    /// Try to parse the JSON string.
    try {
      /// Convert the JSON string to a Map.
      final Map<String, dynamic> jsonMap = json.decode(jsonString!);

      /// Return an ApiResponse object.
      return ApiResponse.fromMap(jsonMap);
    } on ApiResponse catch (apiResponse) {
      /// If there is an error, print it to the console.
      debugPrint('ApiResponse.fromJsonString: ${apiResponse.innerException}');
      return apiResponse;
    } catch (e) {
      /// If there is an error, print it to the console.
      debugPrint('ApiResponse.fromJsonString: $e');

      /// Return an empty ApiResponse object.
      return ApiResponse(
        success: false,
        innerException: 'ApiResponse.fromJsonString: $e',
      );
    }
  }
}
