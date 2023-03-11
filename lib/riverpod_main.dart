import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instabug_flutter_task/app.dart';

//Run the app with the riverpod flavor
//That use the riverpod package for state management
void main({bool useRiverpod = false}) {
  // This is used to disable the debugPrint() function in release mode.
  if (kReleaseMode) debugPrint = (String? message, {int? wrapWidth}) {};

  runApp(
    const ProviderScope(
      child: MyApp(
        useRiverpod: true,
      ),
    ),
  );
}
