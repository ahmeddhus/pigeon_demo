import 'package:flutter/material.dart';

//This widget is used to wrap the home page/riverpod
// and provide a refresh indicator
class AppScaffold extends StatelessWidget {
  final Function() onRefresh;
  final Widget child;

  const AppScaffold({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
      ),
      body: RefreshIndicator(
        //Refresh the movies list
        onRefresh: () => onRefresh(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
