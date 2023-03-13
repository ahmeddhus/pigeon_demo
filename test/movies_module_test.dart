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
      when(mHost.getMovies(any)).thenAnswer((_) async => Mocks.moviesJsonMock);

      // Call the method to fetch the movies
      await moviesModule.getMovies();

      // Verify that the movies have been added to the list
      expect(moviesModule.movies.length, 1);
      expect(moviesModule.movies[0].id, 100);
      expect(moviesModule.movies[0].title, 'Megan');
    });
  });
}