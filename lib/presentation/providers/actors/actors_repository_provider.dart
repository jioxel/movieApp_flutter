import 'package:e_cinemapedia/infraestrucure/datasources/actor_moviedb_datasource.dart';
import 'package:e_cinemapedia/infraestrucure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMvoieDBDatasource());
});
