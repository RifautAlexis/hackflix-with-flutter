// To parse this JSON data, do
//
//     final popularMovies = popularMoviesFromJson(jsonString);

import 'dart:convert';

class PopularMovies {
    PopularMovies({
        this.page,
        this.results,
        this.totalResults,
        this.totalPages,
    });

    final int page;
    final List<Movie> results;
    final int totalResults;
    final int totalPages;

    factory PopularMovies.fromRawJson(String str) => PopularMovies.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PopularMovies.fromJson(Map<String, dynamic> json) => PopularMovies(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null ? null : List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalResults: json["total_results"] == null ? null : json["total_results"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
        "total_results": totalResults == null ? null : totalResults,
        "total_pages": totalPages == null ? null : totalPages,
    };
}

class Movie {
    Movie({
        this.posterPath,
        this.adult,
        this.overview,
        this.releaseDate,
        this.genreIds,
        this.id,
        this.originalTitle,
        this.originalLanguage,
        this.title,
        this.backdropPath,
        this.popularity,
        this.voteCount,
        this.video,
        this.voteAverage,
    });

    final String posterPath;
    final bool adult;
    final String overview;
    final DateTime releaseDate;
    final List<int> genreIds;
    final int id;
    final String originalTitle;
    final OriginalLanguage originalLanguage;
    final String title;
    final String backdropPath;
    final double popularity;
    final int voteCount;
    final bool video;
    final double voteAverage;

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        adult: json["adult"] == null ? null : json["adult"],
        overview: json["overview"] == null ? null : json["overview"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
        title: json["title"] == null ? null : json["title"],
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "poster_path": posterPath == null ? null : posterPath,
        "adult": adult == null ? null : adult,
        "overview": overview == null ? null : overview,
        "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
        "id": id == null ? null : id,
        "original_title": originalTitle == null ? null : originalTitle,
        "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
        "title": title == null ? null : title,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "popularity": popularity == null ? null : popularity,
        "vote_count": voteCount == null ? null : voteCount,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
    };
}

enum OriginalLanguage { EN }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
