import 'package:e_cinemapedia/domain/entities/actor.dart';
import 'package:e_cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final fetchActorsRepository = ref.watch(actorRepositoryProvider);
  return ActorsByMovieNotifier(
      getActors: fetchActorsRepository.getActorByMovie);
});
/*
Funcion:
Almacena un arreglo donde se tiene el id y la movie
para poder almacenar las peliculas que ya se abrieron en  la cache

{
  '456132':<Actor>[],
  '54676':<Actor>[],
  '23468':<Actor>[],
  '4455666':<Actor>[],
  '77777':<Actor>[],
  '999999':<Actor>[]
}
*/
typedef GetActorCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallback getActors;
  ActorsByMovieNotifier({required this.getActors}) : super({});
  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
