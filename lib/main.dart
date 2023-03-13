import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/app.dart';

/// This is the entry point of the application.
/// You can use the `useRiverpod` parameter to switch between the two implementations
/// of the home page.
/// otherwise, the default implementation will be used without state management
/// only setState() will be used
void main({bool useRiverpod = false}) {
  /// This is used to disable the debugPrint() function in release mode.
  if (kReleaseMode) debugPrint = (String? message, {int? wrapWidth}) {};

  runApp(const MyApp());
}
