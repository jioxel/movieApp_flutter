import 'package:e_cinemapedia/domain/datasouces/movies_datasources.dart';
import 'package:e_cinemapedia/domain/entities/movie.dart';
import 'package:e_cinemapedia/domain/repositories/movies_repository.dart';
import 'package:e_cinemapedia/infraestrucure/datasources/moviedb_datasource.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
