import 'package:hackflix/services/provider.dart';

class TestProvider {
  final Http _http = Http();
  
  Future<dynamic> getMovies() => _http.get('/3/movie/popular');
}