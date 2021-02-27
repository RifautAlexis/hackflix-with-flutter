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
          () => Column(
            children: [
              Flexible(
                child: GridView.builder(
                  controller: backboneController.scrollBottomBarController,
                  padding: EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemCount: homeController.popularMovies.length,
                  itemBuilder: (_, index) {
                    return PreviewMovie(
                      index,
                    ); // Give index and not object to test how Get fetch the controller through the widget tree
                  },
                ),
              ),
            ],
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
        ActionChip(label: Text("Popular"), onPressed: () => print("Popular"),),
        SizedBox(width: 10),
        ActionChip(label: Text("Newest"), onPressed: () => print("Newest"),),
        SizedBox(width: 10),
        ActionChip(label: Text("Top rated"), onPressed: () => print("Top rated"),),
        SizedBox(width: 15),
        ActionChip(label: Text("Upcoming"), onPressed: () => print("Upcoming"),),
      ],
    );
  }
}
