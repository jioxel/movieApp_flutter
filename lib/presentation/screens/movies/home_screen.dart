import 'package:e_cinemapedia/presentation/providers/provider.dart';
import 'package:e_cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomButtonNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlidesShow = ref.watch(moviesSlidesShowProvider);
    if (moviesSlidesShow.isEmpty) return const CircularProgressIndicator();
    return CustomScrollView(slivers: [
      SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
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
                movies: nowPlayingMovies,
                title: 'It come',
                subTitle: 'this',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MoviewHorizontalListview(
                movies: nowPlayingMovies,
                title: 'Popular',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MoviewHorizontalListview(
                movies: nowPlayingMovies,
                title: 'Best top',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
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
