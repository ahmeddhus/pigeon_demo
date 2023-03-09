flutter pub run pigeon \
  --input pigeons/movies.api.dart \
  --dart_out lib/generated/pigeon.dart \
  --experimental_swift_out ios/Runner/generated/Pigeon.swift \
  --java_out ./android/app/src/main/java/io/flutter/plugins/Pigeon.java \
  --java_package "io.flutter.plugins"
