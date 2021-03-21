import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/home_controller.dart';
import 'package:hackflix/data/movie.dart';
import 'package:hackflix/widgets/backbone.dart';

class MovieDetailsWidget extends GetView<HomeController> {
  final int id = int.parse(Get.parameters['id']!);

  @override
  Widget build(BuildContext context) {
    final Movie movieDetails = controller.movies
        .firstWhere((Movie movie) => movie.id == id);

    return BackboneWidget(
      body: Column(
        children: [
          Text(movieDetails.title!),
        ],
      ),
    );
  }
}
