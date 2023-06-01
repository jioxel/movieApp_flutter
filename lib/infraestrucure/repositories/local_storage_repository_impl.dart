import 'package:e_cinemapedia/domain/datasouces/local_storage_datasource.dart';
import 'package:e_cinemapedia/domain/entities/movie.dart';
import 'package:e_cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);
  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovie({int limit = 20, offset = 0}) {
    return datasource.loadMovie(limit: limit, offset: offset);
  }

  @override
  Future<void> toogleFavorite(Movie movie) {
    return datasource.toogleFavorite(movie);
  }
}
