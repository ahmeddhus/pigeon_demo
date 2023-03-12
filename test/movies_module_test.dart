import 'package:flutter_test/flutter_test.dart';
import 'package:instabug_flutter_task/modules/movies_module.dart';
import 'package:mockito/annotations.dart';

import 'movies_module_test.mocks.dart';

@GenerateMocks([MoviesModule])
void main() {
  late MockMoviesModule mockMoviesModule;

  setUpAll(() {
    mockMoviesModule = MockMoviesModule();
  });
}
