import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hackflix/data/filter.dart';
import 'package:hackflix/data/in_theater_movies.dart';
import 'package:hackflix/data/movie.dart';
import 'package:hackflix/data/popular_movies.dart';
import 'package:hackflix/data/top_rated_movies.dart';
import 'package:hackflix/data/upcoming_movies.dart';
import 'package:hackflix/services/movie_service.dart';

class HomeController extends GetxController {
  final MovieService _movieService = MovieService();

  var movies = <Movie>[].obs;

  Rx<Filter> selectedFilter = Filter.popular.obs;

  @override
  void onInit() {
    getPopularMovies();
    super.onInit();
  }

  Future<void> getPopularMovies() async {
    PopularMovies popularMoviesfetched = await _movieService.getPopularMovies();
    movies.assignAll(popularMoviesfetched.results!);

    this.selectedFilter.value = Filter.popular;
  }

  Future<void> getInTheaterMovies() async {
    InTheaterMovies popularMoviesfetched = await _movieService.getInTheaterMovies();
    movies.assignAll(popularMoviesfetched.results!);

    this.selectedFilter.value = Filter.inTheater;
  }

  Future<void> getTopRatedMovies() async {
    TopRatedMovies popularMoviesfetched = await _movieService.getTopRatedMovies();
    movies.assignAll(popularMoviesfetched.results!);

    this.selectedFilter.value = Filter.topRated;
  }

  Future<void> getUpcomingMovies() async {
    UpcomingMovies popularMoviesfetched = await _movieService.getUpcomingMovies();
    movies.assignAll(popularMoviesfetched.results!);

    this.selectedFilter.value = Filter.upcoming;
  }

}