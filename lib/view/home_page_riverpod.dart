import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instabug_flutter_task/view/widgets/app_grid_view.dart';
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
    final moviesProvider = ref.watch(getMoviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return ref.refresh(getMoviesProvider);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: moviesProvider.when(
            data: (movies) {
              return movies.isEmpty
                  ? const NoMoviesFound()
                  : HomeGridView(
                      itemCount: movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MovieListItem(
                          movie: movies[index],
                        );
                      },
                    );
            },
            loading: () {
              return HomeGridView(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const MovieItemShimmer();
                },
              );
            },
            error: (error, stack) {
              debugPrint('RiverpodHomePage: $error');
              return const NoMoviesFound();
            },
          ),
        ),
      ),
    );
  }
}
