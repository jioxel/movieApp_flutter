import 'package:e_cinemapedia/domain/entities/actor.dart';
import 'package:e_cinemapedia/infraestrucure/models/moviedb/credits_responce.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'http://image.tmdb.org/t/p/w500/${cast.profilePath}'
          : 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/7/74/Manga_-_Cap%C3%ADtulo_117.png/revision/latest?cb=20200928141612&path-prefix=es',
      character: cast.character);
}
