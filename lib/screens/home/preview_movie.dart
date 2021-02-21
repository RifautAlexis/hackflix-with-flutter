import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hackflix/controllers/home_controller.dart';
import 'package:hackflix/screens/movie_details.dart/movie_details.dart';

class PreviewMovie extends GetView<HomeController> {
  final int index;

  PreviewMovie(this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("/details/${controller.popularMovies[index].id}"),
      child: Container(
        alignment: Alignment.center,
        child: Center(
          child: Text(
            controller.popularMovies[index].title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: 'bold',
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(
              "https://image.tmdb.org/t/p/original${controller.popularMovies[index].posterPath}",
            ),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
      ),
    );
  }
}