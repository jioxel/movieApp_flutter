import 'package:e_cinemapedia/presentation/providers/provider.dart';
import 'package:e_cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView();

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(initialLoadingProvider);
    if (isLoading) return FullScreenLoader();
    //Providers
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final moviesSlidesShow = ref.watch(moviesSlidesShowProvider);
//
    return CustomScrollView(slivers: [
      SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: CustomAppBar(),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideShow(
                movies: moviesSlidesShow,
              ),
              MoviewHorizontalListview(
                movies: nowPlayingMovies,
                title: 'Cine',
                subTitle: 'Only',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MoviewHorizontalListview(
                movies: popularMovies,
                title: 'Popular',
                subTitle: 'this',
                loadNextPage: () {
                  ref.read(popularMoviesMoviesProvider.notifier).loadNextPage();
                },
              ),
              MoviewHorizontalListview(
                movies: upcomingMovies,
                title: 'upcoming',
                loadNextPage: () {
                  ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MoviewHorizontalListview(
                movies: topRatedMovies,
                title: 'Top rated',
                loadNextPage: () {
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
        }, childCount: 1),
      )
    ]);
  }
}
