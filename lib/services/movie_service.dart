import 'package:dio/dio.dart';
import 'package:hackflix/data/movie.dart';
import 'package:hackflix/http.dart';

class MovieService {
  final Http _http = Http();

  Future<PopularMovies> getMovies() async {
    Map<String, dynamic> queryParameters = {
      "language": "en-US",
      "region": "BE"
    };
    
    Response<dynamic> response = await _http.get('/3/movie/popular', queryParameters: queryParameters);
    return PopularMovies.fromJson(response.data);
  }
}
