// Generate the Pigeon code for Dart, Android and iOS.
// This will create the `MoviesHostApi` class in Android and iOS.
// You can run this code with the `generate_pigeon.sh` script.
// See https://pub.dev/packages/pigeon for more information.
import 'package:pigeon/pigeon.dart';

// Define the Pigeon API.
@HostApi()
abstract class MoviesHostApi {

  // Invoke the `getMovies` method on Android and iOS with the `apiKey` parameter and return the result as a `Object?`.
  @async
  String? getMovies(String urlString);
}
