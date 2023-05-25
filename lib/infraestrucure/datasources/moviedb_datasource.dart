import 'package:dio/dio.dart';
import 'package:e_cinemapedia/config/constants/environment.dart';
import 'package:e_cinemapedia/domain/datasouces/movies_datasources.dart';
import 'package:e_cinemapedia/domain/entities/movie.dart';
import 'package:e_cinemapedia/infraestrucure/mappers/movie_mapper.dart';
import 'package:e_cinemapedia/infraestrucure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
      },
    ),
  );
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final movieDBResponse = MovieDbRsponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((element) => element.posterPath != 'no-poster')
        .map((movieDB) => MovieMapper.movieDbToEntity(movieDB))
        .toList();
    return movies;
  }
}
