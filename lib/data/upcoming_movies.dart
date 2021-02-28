import 'package:hackflix/data/dates.dart';
import 'package:hackflix/data/movie.dart';

class UpcomingMovies {
    UpcomingMovies({
        this.page,
        this.results,
        this.dates,
        this.totalPages,
        this.totalResults,
    });

    final int page;
    final List<Movie> results;
    final Dates dates;
    final int totalPages;
    final int totalResults;

    factory UpcomingMovies.fromJson(Map<String, dynamic> json) => UpcomingMovies(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null ? null : List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults: json["total_results"] == null ? null : json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
        "dates": dates == null ? null : dates.toJson(),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
    };
}