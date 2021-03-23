import 'package:dio/dio.dart';
import 'package:hackflix/data/in_theater_movies.dart';
import 'package:hackflix/data/movie_details.dart';
import 'package:hackflix/data/popular_movies.dart';
import 'package:hackflix/data/top_rated_movies.dart';
import 'package:hackflix/data/upcoming_movies.dart';
import 'package:hackflix/http.dart';

class MovieService {
  final Http _http = Http();

  Future<PopularMovies> getPopularMovies() async {
    Map<String, dynamic> queryParameters = {
      "language": "en-US",
      "region": "BE"
    };
    
    Response<dynamic> response = await _http.get('/3/movie/popular', queryParameters: queryParameters);
    return PopularMovies.fromJson(response.data);
  }

  Future<InTheaterMovies> getInTheaterMovies() async {
    Map<String, dynamic> queryParameters = {
      "language": "en-US",
      "region": "BE"
    };
    
    Response<dynamic> response = await _http.get('/3/movie/now_playing', queryParameters: queryParameters);
    return InTheaterMovies.fromJson(response.data);
  }

  Future<TopRatedMovies> getTopRatedMovies() async {
    Map<String, dynamic> queryParameters = {
      "language": "en-US",
      "region": "BE"
    };
    
    Response<dynamic> response = await _http.get('/3/movie/top_rated', queryParameters: queryParameters);
    return TopRatedMovies.fromJson(response.data);
  }

  Future<UpcomingMovies> getUpcomingMovies() async {
    Map<String, dynamic> queryParameters = {
      "language": "en-US",
      "region": "BE"
    };
    
    Response<dynamic> response = await _http.get('/3/movie/upcoming', queryParameters: queryParameters);
    return UpcomingMovies.fromJson(response.data);
  }

  Future<MovieDetails> getMovieDetails(int movieId) async {
    Map<String, dynamic> queryParameters = {
      "language": "en-US"
    };

    Response<dynamic> response = await _http.get('/3/movie/${movieId}', queryParameters: queryParameters);
    return MovieDetails.fromJson(response.data);
  }
}
