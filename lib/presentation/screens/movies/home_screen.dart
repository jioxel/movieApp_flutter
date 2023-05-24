import 'package:e_cinemapedia/config/constants/environment.dart';
import 'package:e_cinemapedia/presentation/providers/provider.dart';
import 'package:e_cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
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
    final moviesSlidesShow = ref.watch(moviesSlidesShowProvider);
    if (moviesSlidesShow.isEmpty) return const CircularProgressIndicator();
    return Column(
      children: [
        CustomAppBar(),
        MoviesSlideShow(
          movies: moviesSlidesShow,
        )
      ],
    );
  }
}
