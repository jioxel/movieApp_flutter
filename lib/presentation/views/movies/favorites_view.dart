import 'package:e_cinemapedia/presentation/providers/provider.dart';
import 'package:e_cinemapedia/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(favoriteMoviesProvider).values.toList();
    if (movies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_outline_outlined,
                  color: colors.primary,
                ),
                Text(
                  'Ohhhh no!!',
                  style: TextStyle(fontSize: 30, color: colors.primary),
                ),
              ]),
        ),
      );
    }
    return Scaffold(
        body: MovieMasonry(
      movies: movies,
      loadNextPage: loadNextPage,
    ));
  }
}
