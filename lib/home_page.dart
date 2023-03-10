import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/generated/pigeon.dart';
import 'package:instabug_flutter_task/models/movie.dart';
import 'package:instabug_flutter_task/utils/api_links.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: movies.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final Movie movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(movie.title ?? ''),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getMovies(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getMovies() async {
    dynamic response = await MoviesHostApi().getMovies('$moviesApiUrl$apiKey');
    if (kDebugMode) debugPrint('response: $response');
  }
}
