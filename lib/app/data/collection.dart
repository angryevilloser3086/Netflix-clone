class CollectionMovie {
  CollectionMovie({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.parts,
  });
  late final int id;
  late final String name;
  late final String overview;
  late final String posterPath;
  late final String backdropPath;
  late final List<Parts> parts;

  factory CollectionMovie.fromJson(Map<String, dynamic> json) =>
      CollectionMovie(
          id: json['id'],
          name: json['name'],
          overview: json['overview'],
          posterPath: json['poster_path'],
          backdropPath: json['backdrop_path'],
          parts:
              List.from(json['parts']).map((e) => Parts.fromJson(e)).toList());

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'overview': overview,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
        'parts': parts.map((e) => e.toJson()).toList(),
      };
}

class Parts {
  Parts({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final int voteCount;

  factory Parts.fromJson(Map<String, dynamic> json) => Parts(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        genreIds: List.castFrom<dynamic, int>(json['genre_ids']),
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
