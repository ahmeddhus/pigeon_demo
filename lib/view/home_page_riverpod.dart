import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instabug_flutter_task/models/movie.dart';
import 'package:instabug_flutter_task/view/widgets/app_grid_view.dart';
import 'package:instabug_flutter_task/view/widgets/app_scaffold.dart';
import 'package:instabug_flutter_task/view/widgets/movie_item_shimmer.dart';
import 'package:instabug_flutter_task/view/widgets/movie_list_item.dart';
import 'package:instabug_flutter_task/view/widgets/no_movies_found.dart';
import 'package:instabug_flutter_task/viewModels/movies_view_model.dart';

class RiverpodHomePage extends ConsumerWidget {
  const RiverpodHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MoviesViewModel moviesViewModel = ref.watch(moviesModuleProvider);
    final List<Movie> movies = moviesViewModel.movies;

    return AppScaffold(
      onRefresh: () {
        ref.invalidate(moviesModuleProvider);
        return moviesViewModel.onRefresh();
      },
      child: moviesViewModel.isLoading
          ? HomeGridView(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const MovieItemShimmer();
              },
            )
          : Stack(
              children: [
                if (movies.isEmpty && !moviesViewModel.isLoading)
                  const Positioned.fill(
                    child: NoMoviesFound(),
                  ),
                HomeGridView(
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieListItem(
                      movie: movies[index],
                    );
                  },
                ),
              ],
            ),
    );
  }
}
