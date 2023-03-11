import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/app.dart';

void main({bool useRiverpod = false}) {
  // This is used to disable the debugPrint() function in release mode.
  if (kReleaseMode) debugPrint = (String? message, {int? wrapWidth}) {};

  runApp(const MyApp());
}

