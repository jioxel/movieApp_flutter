import 'package:e_cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageRepository {
  Future<void> toogleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int movieId);
  Future<List<Movie>> loadMovie({int limit = 20, offset = 0});
}
