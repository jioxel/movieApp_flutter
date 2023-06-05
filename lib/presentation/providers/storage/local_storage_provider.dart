import 'package:e_cinemapedia/infraestrucure/datasources/isar_datasource.dart';
import 'package:e_cinemapedia/infraestrucure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
