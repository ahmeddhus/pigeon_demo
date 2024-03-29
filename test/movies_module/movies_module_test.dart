import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instabug_flutter_task/generated/pigeon.dart';
import 'package:instabug_flutter_task/modules/movies_module.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_response_mocks.dart';
import 'movies_module_test.mocks.dart';

@GenerateMocks([
  MoviesHostApi,
])
void main() {
  // Initialize the Flutter binding before running the test case
  WidgetsFlutterBinding.ensureInitialized();

  group('MoviesModule with valid JSON responses', () {
    final mHost = MockMoviesHostApi();
    final moviesModule = MoviesModule();

    setUpAll(() {
      moviesModule.$setHostApi(mHost);
    });

    //Test to check if the list is not empty.
    test('should fetch and add movies to the list', () async {
      // Mock the response from the API
      when(mHost.getMovies(any)).thenAnswer((_) async => ApiResponseMocks.moviesMock);

      // Call the method to fetch the movies
      await moviesModule.getMovies();

      // Verify ApiResponse properties.
      expect(moviesModule.apiResponse?.page, 1);
      expect(moviesModule.apiResponse?.totalResults, 10000);
      expect(moviesModule.apiResponse?.totalPages, 500);

      // Verify that the movies have been added to the list
      expect(moviesModule.movies.length, 2);

      expect(moviesModule.movies[0].id, 1);
      expect(moviesModule.movies[0].title, 'Movie 1');
      expect(moviesModule.movies[0].voteAverage, 10.0);
      expect(moviesModule.movies[0].overview, 'overview1');
      expect(moviesModule.movies[0].posterPath, '/poster_path1');
      expect(moviesModule.movies[0].releaseDate, DateTime.parse('2020-01-01'));

      expect(moviesModule.movies[1].id, 2);
      expect(moviesModule.movies[1].title, 'Movie 2');
      expect(moviesModule.movies[1].voteAverage, 20.0);
      expect(moviesModule.movies[1].overview, 'overview2');
      expect(moviesModule.movies[1].posterPath, '/poster_path2');
      expect(moviesModule.movies[1].releaseDate, DateTime.parse('2020-02-02'));
    });


    //Test to check if the list is empty after refresh
    test('should fetch and add no movies to the list after refresh', () async {
      // Mock the response from the API
      when(mHost.getMovies(any)).thenAnswer((_) async => ApiResponseMocks.emptyMoviesListMock);

      await moviesModule.onRefresh();

      // Call the method to fetch the movies
      await moviesModule.getMovies();

      // Verify that the movies have been added to the list
      expect(moviesModule.movies.length, 0);
    });

    //Test to check if the list is empty after refresh
    test('should fetch and return empty error message', () async {
      // Mock the response from the API
      when(mHost.getMovies(any)).thenAnswer((_) async => ApiResponseMocks.errorResponseMock);

      // Call the method to fetch the movies
      await moviesModule.getMovies();

      expect(moviesModule.apiResponse?.statusCode, 7);
      expect(moviesModule.apiResponse?.statusMessage,
          "Invalid API key: You must be granted a valid key.");
      expect(moviesModule.apiResponse?.success, false);

      // Verify that the movies have been added to the list
      expect(moviesModule.movies.length, 0);
    });

    //Test to check if the list is empty after refresh
    test('should fetch and return full json expect results', () async {
      // Mock the response from the API
      when(mHost.getMovies(any)).thenAnswer((_) async => ApiResponseMocks.noMoviesListMock);

      // Call the method to fetch the movies
      await moviesModule.getMovies();

      // Verify ApiResponse properties.
      expect(moviesModule.apiResponse?.page, 1);
      expect(moviesModule.apiResponse?.totalResults, 10000);
      expect(moviesModule.apiResponse?.totalPages, 500);

      // Verify that the movies have been added to the list
      expect(moviesModule.movies.length, 0);
    });
  });

  group('MoviesModule with invalid JSON responses', () {
    final mHost = MockMoviesHostApi();
    final moviesModule = MoviesModule();

    setUpAll(() {
      moviesModule.$setHostApi(mHost);
    });

    //Test to check if the list still empty after invalid JSON response
    test('should not fetch and return only inner exception', () async {
      // Mock the response from the API
      when(mHost.getMovies(any)).thenAnswer((_) async => ApiResponseMocks.invalidJsonMock);

      // Call the method to fetch the movies
      await moviesModule.getMovies();

      expect(moviesModule.apiResponse?.innerException, contains("ApiResponse.fromJsonString:"));
      expect(moviesModule.apiResponse?.success, false);

      // Verify that the movies have been added to the list
      expect(moviesModule.movies.length, 0);
    });

    //Test to check if the list still empty after return empty string
    test('should not fetch and return only inner exception', () async {
      // Mock the response from the API
      when(mHost.getMovies(any)).thenAnswer((_) async => '');

      // Call the method to fetch the movies
      await moviesModule.getMovies();

      expect(moviesModule.apiResponse?.innerException, contains("ApiResponse.fromJsonString:"));
      expect(moviesModule.apiResponse?.success, false);

      // Verify that the movies have been added to the list
      expect(moviesModule.movies.length, 0);
    });

    //Test to check if the list still empty after return normal string
    test('should not fetch and return only inner exception', () async {
      // Mock the response from the API
      when(mHost.getMovies(any)).thenAnswer((_) async => 'Error');

      // Call the method to fetch the movies
      await moviesModule.getMovies();

      expect(moviesModule.apiResponse?.innerException, contains("ApiResponse.fromJsonString:"));
      expect(moviesModule.apiResponse?.success, false);

      // Verify that the movies have been added to the list
      expect(moviesModule.movies.length, 0);
    });


    //Test to check if the list still empty after return null
    test('should not fetch and return only inner exception', () async {
      // Mock the response from the API
      when(mHost.getMovies(any)).thenAnswer((_) async => null);

      // Call the method to fetch the movies
      await moviesModule.getMovies();

      expect(moviesModule.apiResponse?.innerException, contains("ApiResponse.fromJsonString:"));
      expect(moviesModule.apiResponse?.success, false);

      // Verify that the movies have been added to the list
      expect(moviesModule.movies.length, 0);
    });
  });
}