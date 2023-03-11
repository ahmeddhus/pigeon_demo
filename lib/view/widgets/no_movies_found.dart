import 'package:flutter/material.dart';


//This widget is used to show a message when no movies are found
class NoMoviesFound extends StatelessWidget {
  const NoMoviesFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No movies found'),
    );
  }
}
