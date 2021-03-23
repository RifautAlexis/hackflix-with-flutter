import 'package:get/get.dart';
import 'package:hackflix/data/movie_details.dart';
import 'package:hackflix/services/movie_service.dart';

class MovieDetailsController extends GetxController {
  final MovieService _movieService = MovieService();

  Rx<MovieDetails> movieDetails = MovieDetails().obs;

  @override
  void onInit() {
    movieDetails.value = null;
    super.onInit();
  }

  Future<void> getMovieDetails(int movieId) async {
    MovieDetails movieDetailsfetched = await _movieService.getMovieDetails(movieId);
    movieDetails.value = movieDetailsfetched;
  }
}