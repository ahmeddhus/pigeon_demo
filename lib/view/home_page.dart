import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/generated/pigeon.dart';
import 'package:instabug_flutter_task/models/api_response.dart';
import 'package:instabug_flutter_task/models/movie.dart';
import 'package:instabug_flutter_task/utils/api_links.dart';
import 'package:instabug_flutter_task/view/widgets/movie_item_shimmer.dart';
import 'package:instabug_flutter_task/view/widgets/movie_item_widget.dart';

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
      loading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Replace with the width of your item
    const itemWidth = 120.0;

    // Calculate the number of items that can fit in a row with the given width
    //accounting to screen width and item given width.
    final itemCount = (screenWidth / itemWidth).floor();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _movies.isEmpty && !loading
            ? const Center(
                child: Text('No movies found'),
              )
            : GridView.builder(
                itemCount: _movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //Show 10 items in a row when the movies are being fetched from the API
                  //and show the calculated number of items in a row when the movies are fetched
                  crossAxisCount: loading ? 10 : itemCount,

                  // Set the cross axis spacing(horizontal spacing) to 8 to make the items
                  crossAxisSpacing: 8,

                  // Set the main axis spacing(vertical) to 8 to make the items
                  mainAxisSpacing: 8,

                  // Set the child aspect ratio to 2/3 to make the items
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  //Show a Shimmer widget while the movies are being fetched from the API
                  //and show the movie item widget when the movies are fetched
                  return loading
                      ? const MovieItemShimmer()
                      : MovieItemWidget(movie: _movies[index]);
                },
              ),
      ),
    );
  }
}
