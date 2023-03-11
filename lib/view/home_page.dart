import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/modules/movies_module.dart';
import 'package:instabug_flutter_task/view/widgets/app_grid_view.dart';
import 'package:instabug_flutter_task/view/widgets/app_scaffold.dart';
import 'package:instabug_flutter_task/view/widgets/movie_item_shimmer.dart';
import 'package:instabug_flutter_task/view/widgets/movie_list_item.dart';
import 'package:instabug_flutter_task/view/widgets/no_movies_found.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Flag to indicate if the movies are being fetched from the API
  //to show a progress indicator
  bool loading = true;

  @override
  void initState() {
    super.initState();

    //Fetch movies from the API
    _getMovies();
  }

  @override
  Widget build(BuildContext context) {
    final MoviesModule moviesModule = MoviesModule.instance;
    final bool isFetchedMoviesEmpty = moviesModule.movies.isEmpty && !loading;

    return AppScaffold(
      onRefresh: _onRefresh,

      //Wrap in stack so that the [RefreshIndicator] working fine
      //Because the [RefreshIndicator] must wrap the scrollable widget
      child: Stack(
        children: [
          if (isFetchedMoviesEmpty)
            const Positioned.fill(
              child: NoMoviesFound(),
            ),
          HomeGridView(
            itemCount: loading ? 10 : moviesModule.movies.length,
            itemBuilder: (BuildContext context, int index) {
              return loading
                  ? const MovieItemShimmer()
                  : MovieListItem(
                      movie: moviesModule.movies[index],
                    );
            },
          ),
        ],
      ),
    );
  }

  //Fetch movies from the API
  Future<void> _getMovies() async {
    await MoviesModule.instance.getMovies();
    _toggleLoading(on: false);
  }

  //Refresh the movies list
  Future<void> _onRefresh() async {
    _toggleLoading(on: true);
    await MoviesModule.instance.onRefresh();
    _toggleLoading(on: false);
  }

  //Toggle the loading flag and update the UI
  void _toggleLoading({required bool on}) {
    loading = on;
    setState(() {});
  }
}
