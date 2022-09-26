// class Movie {
//   Movie({
//     required this.adult,
//     required this.backdropPath,
//     this.belongsToCollection,
//     required this.budget,
//     required this.genres,
//     required this.homepage,
//     required this.id,
//     required this.imdbId,
//     required this.originalLanguage,
//     required this.originalTitle,
//     required this.overview,
//     required this.popularity,
//     required this.posterPath,
//     required this.productionCompanies,
//     required this.productionCountries,
//     required this.releaseDate,
//     required this.revenue,
//     required this.runtime,
//     required this.spokenLanguages,
//     required this.status,
//     required this.tagline,
//     required this.title,
//     required this.video,
//     required this.voteAverage,
//     required this.voteCount,
//   });
//   late final bool adult;
//   late final String backdropPath;
//   late final Null belongsToCollection;
//   late final int budget;
//   late final List<Genres> genres;
//   late final String homepage;
//   late final int id;
//   late final String imdbId;
//   late final String originalLanguage;
//   late final String originalTitle;
//   late final String overview;
//   late final double popularity;
//   late final String posterPath;
//   late final List<ProductionCompanies> productionCompanies;
//   late final List<ProductionCountries> productionCountries;
//   late final String releaseDate;
//   late final int revenue;
//   late final int runtime;
//   late final List<SpokenLanguages> spokenLanguages;
//   late final String status;
//   late final String tagline;
//   late final String title;
//   late final bool video;
//   late final double voteAverage;
//   late final int voteCount;

//   factory Movie.fromJson(Map<String, dynamic> json) => Movie(
//         adult: json['adult'],
//         backdropPath: json['backdrop_path'],
//         belongsToCollection: null,
//         budget: json['budget'],
//         genres:
//             List.from(json['genres']).map((e) => Genres.fromJson(e)).toList(),
//         homepage: json['homepage'],
//         id: json['id'],
//         imdbId: json['imdb_id'],
//         originalLanguage: json['original_language'],
//         originalTitle: json['original_title'],
//         overview: json['overview'],
//         popularity: json['popularity'],
//         posterPath: json['poster_path'],
//         productionCompanies: List.from(json['production_companies'])
//             .map((e) => ProductionCompanies.fromJson(e))
//             .toList(),
//         productionCountries: List.from(json['production_countries'])
//             .map((e) => ProductionCountries.fromJson(e))
//             .toList(),
//         releaseDate: json['release_date'],
//         revenue: json['revenue'],
//         runtime: json['runtime'],
//         spokenLanguages: List.from(json['spoken_languages'])
//             .map((e) => SpokenLanguages.fromJson(e))
//             .toList(),
//         status: json['status'],
//         tagline: json['tagline'],
//         title: json['title'],
//         video: json['video'],
//         voteAverage: json['vote_average'],
//         voteCount: json['vote_count'],
//       );

//   Map<String, dynamic> toJson() => {
//         'adult': adult,
//         'backdrop_path': backdropPath,
//         'belongs_to_collection': belongsToCollection,
//         'budget': budget,
//         'genres': genres.map((e) => e.toJson()).toList(),
//         'homepage': homepage,
//         'id': id,
//         'imdb_id': imdbId,
//         'original_language': originalLanguage,
//         'original_title': originalTitle,
//         'overview': overview,
//         'popularity': popularity,
//         'poster_path': posterPath,
//         'production_companies':
//             productionCompanies.map((e) => e.toJson()).toList(),
//         'production_countries':
//             productionCountries.map((e) => e.toJson()).toList(),
//         'release_date': releaseDate,
//         'revenue': revenue,
//         'runtime': runtime,
//         'spoken_languages': spokenLanguages.map((e) => e.toJson()).toList(),
//         'status': status,
//         'tagline': tagline,
//         'title': title,
//         'video': video,
//         'vote_average': voteAverage,
//         'vote_count': voteCount
//       };
// }

// class Genres {
//   Genres({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;

//   factory Genres.fromJson(Map<String, dynamic> json)=>Genres(
//     id : json['id'],
//     name : json['name']
//   );

//   Map<String, dynamic> toJson() => {'id': id, 'name': name};
// }

// class ProductionCompanies {
//   ProductionCompanies({
//     required this.id,
//     this.logoPath,
//     required this.name,
//     required this.originCountry,
//   });
//   late final int id;
//   late final String? logoPath;
//   late final String name;
//   late final String originCountry;

//   factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
//       ProductionCompanies(
//           id: json['id'],
//           logoPath: json['logo_path'] ?? "",
//           name: json['name'],
//           originCountry: json['origin_country']);
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'logo_path': logoPath,
//         'name': name,
//         'origin_country': originCountry
//       };
// }

// class ProductionCountries {
//   ProductionCountries({
//     required this.iso_3166_1,
//     required this.name,
//   });
//   String iso_3166_1;
//   String name;

//   factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
//       ProductionCountries(
//         iso_3166_1: json['iso_3166_1'],
//         name: json['name'],
//       );

//   Map<String, dynamic> toJson() => {'iso_3166_1': iso_3166_1, 'name': name};
// }

// class SpokenLanguages {
//   SpokenLanguages({
//     required this.englishName,
//     required this.iso_639_1,
//     required this.name,
//   });
//   String englishName;
//   String iso_639_1;
//   String name;

//   factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
//       SpokenLanguages(
//         englishName: json['english_name'],
//         iso_639_1: json['iso_639_1'],
//         name: json['name'],
//       );

//   Map<String, dynamic> toJson() => {
//         'english_name': englishName,
//         'iso_639_1': iso_639_1,
//         'name': name,
//       };
// }
