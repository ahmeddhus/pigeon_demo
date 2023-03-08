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

/// Generated class from Pigeon that represents data sent in messages.
struct Movie {
  var title: String? = nil
  var date: String? = nil

  static func fromList(_ list: [Any]) -> Movie? {
    let title = list[0] as! String? 
    let date = list[1] as! String? 

    return Movie(
      title: title,
      date: date
    )
  }
  func toList() -> [Any?] {
    return [
      title,
      date,
    ]
  }
}

private class MoviesApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return Movie.fromList(self.readValue() as! [Any])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class MoviesApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Movie {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class MoviesApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return MoviesApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return MoviesApiCodecWriter(data: data)
  }
}

class MoviesApiCodec: FlutterStandardMessageCodec {
  static let shared = MoviesApiCodec(readerWriter: MoviesApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol MoviesApi {
  func getMovies(pageNumber: Int32, completion: @escaping (Result<[Movie?], Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class MoviesApiSetup {
  /// The codec used by MoviesApi.
  static var codec: FlutterStandardMessageCodec { MoviesApiCodec.shared }
  /// Sets up an instance of `MoviesApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: MoviesApi?) {
    let getMoviesChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.MoviesApi.getMovies", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getMoviesChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let pageNumberArg = args[0] as! Int32
        api.getMovies(pageNumber: pageNumberArg) { result in
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
