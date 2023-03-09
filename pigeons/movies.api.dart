// Generate the Pigeon code for Dart, Android and iOS.
// This will create the `MoviesHostApi` class in Android and iOS.
// You can run this code with the generate_pigeon.sh script.
// See https://pub.dev/packages/pigeon for more information.
import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class MoviesHostApi {
  @async
  Object? getMovies(String apiKey);
}
