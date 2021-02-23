import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hackflix/data/movie.dart';
import 'package:hackflix/services/movie_service.dart';

class HomeController extends GetxController {
  final MovieService _movieService = MovieService();

  var popularMovies = List<Movie>().obs;

  @override
  void onInit() {
    getMovies();
    super.onInit();
  }

  Future<void> getMovies() async {
    PopularMovies popularMoviesfetched = await _movieService.getMovies();
    popularMovies.assignAll(popularMoviesfetched.results);
  }

}