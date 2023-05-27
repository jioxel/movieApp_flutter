import 'package:e_cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movie_repository_provider.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final fetchMoreMovires = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovie: fetchMoreMovires);
});
/*
Funcion:
Almacena un arreglo donde se tiene el id y la movie
para poder almacenar las peliculas que ya se abrieron en  la cache

{
  '456132':Movie(),
  '54676':Movie(),
  '23468':Movie(),
  '4455666':Movie(),
  '77777':Movie(),
  '999999':Movie()
}
*/
typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;
  MovieMapNotifier({required this.getMovie}) : super({});
  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    print('Realizando http ');
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}
