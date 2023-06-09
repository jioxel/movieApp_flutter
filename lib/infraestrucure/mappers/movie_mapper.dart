import 'package:e_cinemapedia/domain/entities/movie.dart';
import 'package:e_cinemapedia/infraestrucure/models/moviedb/movie_details.dart';
import 'package:e_cinemapedia/infraestrucure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieFromMovieDB movieDB) => Movie(
      adult: movieDB.adult,
      backdropPath: movieDB.backdropPath != ''
          ? 'http://image.tmdb.org/t/p/w500/${movieDB.backdropPath}'
          : 'https://i.pinimg.com/564x/18/19/02/181902426d218c4df1e1d181da347183.jpg',
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: movieDB.posterPath != ''
          ? 'http://image.tmdb.org/t/p/w500/${movieDB.posterPath}'
          : 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/7/74/Manga_-_Cap%C3%ADtulo_117.png/revision/latest?cb=20200928141612&path-prefix=es',
      releaseDate: movieDB.releaseDate ?? DateTime.now(),
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount);

  static Movie movieDetailsToEntity(MovieDetails movieDB) => Movie(
      adult: movieDB.adult,
      backdropPath: movieDB.backdropPath != ''
          ? 'http://image.tmdb.org/t/p/w500/${movieDB.backdropPath}'
          : 'https://i.pinimg.com/564x/18/19/02/181902426d218c4df1e1d181da347183.jpg',
      genreIds: movieDB.genres.map((e) => e.name).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: movieDB.posterPath != ''
          ? 'http://image.tmdb.org/t/p/w500/${movieDB.posterPath}'
          : 'https://i.pinimg.com/564x/18/19/02/181902426d218c4df1e1d181da347183.jpg',
      releaseDate: movieDB.releaseDate,
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount);
}
