import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instabug_flutter_task/generated/pigeon.dart';
import 'package:instabug_flutter_task/modules/movies_module.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';
import 'movies_module_test.mocks.dart';

@GenerateMocks([
  MoviesHostApi,
])
void main() {
  // Initialize the Flutter binding before running the test case
  WidgetsFlutterBinding.ensureInitialized();

  group('MoviesModule', () {
    final mHost = MockMoviesHostApi();
    final moviesModule = MoviesModule();

    setUpAll(() {
      moviesModule.$setHostApi(mHost);
    });

    test('should fetch and add movies to the list', () async {
      // Mock the response from the API
      when(mHost.getMovies(any)).thenAnswer((_) async => Mocks.moviesMock);

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
      when(mHost.getMovies(any)).thenAnswer((_) async => Mocks.emptyMoviesListMock);

      await moviesModule.onRefresh();

      // Call the method to fetch the movies
      await moviesModule.getMovies();

      // Verify that the movies have been added to the list
      expect(moviesModule.movies.length, 0);

    });
  });
}