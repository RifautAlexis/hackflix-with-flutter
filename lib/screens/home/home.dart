import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/backbone_controller.dart';
import 'package:hackflix/controllers/home_controller.dart';
import 'package:hackflix/screens/home/animated_filter.dart';
import 'package:hackflix/screens/home/preview_movie.dart';
import 'package:hackflix/widgets/backbone.dart';

class Home extends StatelessWidget {
  final BackboneController backboneController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(context) => Backbone(
        appbarSubWidget: _buildAppbarSubWidget(),
        body: Obx(
          () => homeController.movies.isNotEmpty
              ? GridView.builder(
                  controller: backboneController.scrollBottomBarController,
                  padding: EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemCount: homeController.movies.length,
                  itemBuilder: (_, index) {
                    return PreviewMovie(
                      index,
                    ); // Give index and not object to test how Get fetch the controller through the widget tree
                  },
                )
              : Center(
                  child: Text("No Movies have been found"),
                ),
        ),
        floatingActionButton: AnimatedFilter(
          onClick: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );

  Widget _buildAppbarSubWidget() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        ActionChip(
          label: Text("Popular"),
          onPressed: () => homeController.getPopularMovies(),
        ),
        SizedBox(width: 10),
        ActionChip(
          label: Text("In theater"),
          onPressed: () => homeController.getInTheaterMovies(),
        ),
        SizedBox(width: 10),
        ActionChip(
          label: Text("Top rated"),
          onPressed: () => homeController.getTopRatedMovies(),
        ),
        SizedBox(width: 10),
        ActionChip(
          label: Text("Upcoming"),
          onPressed: () => homeController.getUpcomingMovies(),
        ),
      ],
    );
  }
}
