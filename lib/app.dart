import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/view/home_page.dart';
import 'package:instabug_flutter_task/view/home_page_riverpod.dart';

class MyApp extends StatefulWidget {
  final bool useRiverpod;

  const MyApp({super.key, this.useRiverpod = false});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: widget.useRiverpod ? const RiverpodHomePage() : const HomePage(),
    );
  }
}
