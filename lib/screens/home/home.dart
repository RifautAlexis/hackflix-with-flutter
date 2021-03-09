import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/backbone_controller.dart';
import 'package:hackflix/controllers/home_controller.dart';
import 'package:hackflix/data/filter.dart';
import 'package:hackflix/screens/home/animated_filter.dart';
import 'package:hackflix/screens/home/preview_movie.dart';
import 'package:hackflix/widgets/backbone.dart';
import 'package:hackflix/widgets/custom_appbar.dart';

class Home extends StatelessWidget {
  final BackboneController backboneController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(context) => Backbone(
        appBar: _buildAppBar(),
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

  CustomAppbar _buildAppBar() => CustomAppbar(
    middleText: 'HELLO_WORLD'.tr,
    appbarSubWidget: _buildAppbarSubWidget(),
  );

  Widget _buildAppbarSubWidget() {
    return Obx(
      () => ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          FilterChip(
            label: Text("Popular"),
            onSelected: (isSelected) => homeController.getPopularMovies(),
            selectedColor: Colors.limeAccent,
            selected: homeController.selectedFilter.value == Filter.popular,
            showCheckmark: false,
          ),
          SizedBox(width: 10),
          FilterChip(
            label: Text("In theater"),
            onSelected: (isSelected) => homeController.getInTheaterMovies(),
            selectedColor: Colors.limeAccent,
            selected: homeController.selectedFilter.value == Filter.inTheater,
            showCheckmark: false,
          ),
          SizedBox(width: 10),
          FilterChip(
            label: Text("Top rated"),
            onSelected: (isSelected) => homeController.getTopRatedMovies(),
            selectedColor: Colors.limeAccent,
            selected: homeController.selectedFilter.value == Filter.topRated,
            showCheckmark: false,
          ),
          SizedBox(width: 10),
          FilterChip(
            label: Text("Upcoming"),
            onSelected: (isSelected) => homeController.getUpcomingMovies(),
            selectedColor: Colors.limeAccent,
            selected: homeController.selectedFilter.value == Filter.upcoming,
            showCheckmark: false,
          ),
        ],
      ),
    );
  }
}
