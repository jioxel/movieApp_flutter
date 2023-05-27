import 'package:e_cinemapedia/domain/entities/actor.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorByMovie(String movieId);
}
