import 'package:dio/dio.dart';
import 'package:e_cinemapedia/config/constants/environment.dart';
import 'package:e_cinemapedia/domain/datasouces/actors_datasource.dart';
import 'package:e_cinemapedia/domain/entities/actor.dart';
import 'package:e_cinemapedia/infraestrucure/mappers/actor_mapper.dart';
import 'package:e_cinemapedia/infraestrucure/models/moviedb/credits_responce.dart';

class ActorMvoieDBDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
      },
    ),
  );

  // regresa el listado de Actores
  List<Actor> _jsonToActor(Map<String, dynamic> json) {
    final actorDBResponce = CreditsResponce.fromJson(json);
    final List<Actor> actor = actorDBResponce.cast
        .map((actorDB) => ActorMapper.castToEntity(actorDB))
        .toList();
    return actor;
  }

  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    return _jsonToActor(response.data);
  }
}
