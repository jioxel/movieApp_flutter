import 'package:e_cinemapedia/domain/datasouces/local_storage_datasource.dart';
import 'package:e_cinemapedia/domain/entities/movie.dart';

class IsarDatasource extends LocalStorageDatasource {
  @override
  Future<bool> isMovieFavorite(int movieId) {
    // TODO: implement isMovieFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovie({int limit = 20, offset = 0}) {
    // TODO: implement loadMovie
    throw UnimplementedError();
  }

  @override
  Future<void> toogleFavorite(Movie movie) {
    // TODO: implement toogleFavorite
    throw UnimplementedError();
  }
}
