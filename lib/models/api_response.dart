
// This is a generic model class for the API response.
// It is used to parse the JSON response from the API.
import 'dart:convert';

class ApiResponse {

  // Page number of the current response.
  final int? page;

  // Total number of pages.
  final int? totalPages;

  // Total number of results.
  final int? totalResults;

  // The `results` property is dynamic because it can be a list of movies, a list of TV shows, etc.
  final dynamic results;

  ApiResponse({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

  // This method is used to parse the JSON response from the API.
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      page: int.tryParse(json['page']),
      totalPages: int.tryParse(json['total_pages']),
      totalResults: int.tryParse(json['total_results']),
      results: json['results'],
    );
  }

  //Convert from json string to ApiResponse object
  factory ApiResponse.fromJsonString(String jsonString) {
    return ApiResponse.fromJson(json.decode(jsonString));
  }
}
