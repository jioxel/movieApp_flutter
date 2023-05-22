import 'package:e_cinemapedia/infraestrucure/datasources/moviedb_datasource.dart';
import 'package:e_cinemapedia/infraestrucure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
