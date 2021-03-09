import 'package:hackflix/data/movie.dart';

class PopularMovies {
    PopularMovies({
        this.page,
        this.results,
        this.totalResults,
        this.totalPages,
    });

    final int? page;
    final List<Movie>? results;
    final int? totalResults;
    final int? totalPages;

    factory PopularMovies.fromJson(Map<String, dynamic> json) => PopularMovies(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null ? null : List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalResults: json["total_results"] == null ? null : json["total_results"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_results": totalResults == null ? null : totalResults,
        "total_pages": totalPages == null ? null : totalPages,
    };
}