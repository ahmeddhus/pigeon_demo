import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/generated/pigeon.dart';
import 'package:instabug_flutter_task/models/api_response.dart';
import 'package:instabug_flutter_task/models/movie.dart';
import 'package:instabug_flutter_task/utils/api_links.dart';
import 'package:instabug_flutter_task/view/widgets/app_grid_view.dart';
import 'package:instabug_flutter_task/view/widgets/movie_item_shimmer.dart';
import 'package:instabug_flutter_task/view/widgets/movie_item_widget.dart';
import 'package:instabug_flutter_task/view/widgets/no_movies_found.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of movies fetched from the API
  final List<Movie> _movies = [];

  //Flag to indicate if the movies are being fetched from the API
  //to show a progress indicator
  bool loading = false;

  @override
  void initState() {
    super.initState();

    //Fetch movies from the API
    _getMovies();
  }

  //Fetch movies from the API
  Future<void> _getMovies() async {
    try {
      //Invoke the API to fetch movies from the API which is implemented in the native side
      dynamic response = await MoviesHostApi().getMovies('$moviesApiUrl$apiKey');

      //Check if the response is a string
      if (response is String) {
        ApiResponse apiResponse = ApiResponse.fromJsonString(response);

        //Check if the response is a list of maps
        if (apiResponse.results is List<Map>) {
          //Add the movies to the list
          _movies.addAll(
              (apiResponse.results as List).map((itemWord) => Movie.fromMap(itemWord)).toList());
        }
      }
    } catch (e) {
      debugPrint('_getMovies(): $e');
    } finally {
      _toggleLoading(on: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
      ),
      body: RefreshIndicator(
        //Refresh the movies list
        onRefresh: () => _onRefresh(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _movies.isEmpty && !loading
              ? const NoMoviesFound()
              : HomeGridView(
                  itemCount: loading ? 10 : _movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return loading
                        ? const MovieItemShimmer()
                        : MovieItemWidget(
                            movie: _movies[index],
                          );
                  },
                ),
        ),
      ),
    );
  }

  //Refresh the movies list
  Future<void> _onRefresh() async {
    _toggleLoading(on: true);
    _movies.clear();
    await _getMovies();
  }

  //Toggle the loading flag and update the UI
  void _toggleLoading({required bool on}) {
    loading = on;
    setState(() {});
  }
}
