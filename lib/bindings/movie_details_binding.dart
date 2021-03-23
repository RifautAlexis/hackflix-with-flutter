import 'package:get/get.dart';
import 'package:hackflix/controllers/movie_details_controller.dart';

class MovieDetailsBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsController>(() => MovieDetailsController());
  }
}