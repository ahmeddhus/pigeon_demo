// Autogenerated from Pigeon (v9.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif



private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol MoviesHostApi {
  func getMovies(urlString: String, completion: @escaping (Result<Any?, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class MoviesHostApiSetup {
  /// The codec used by MoviesHostApi.
  /// Sets up an instance of `MoviesHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: MoviesHostApi?) {
    let getMoviesChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.MoviesHostApi.getMovies", binaryMessenger: binaryMessenger)
    if let api = api {
      getMoviesChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let urlStringArg = args[0] as! String
        api.getMovies(urlString: urlStringArg) { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      getMoviesChannel.setMessageHandler(nil)
    }
  }
}
