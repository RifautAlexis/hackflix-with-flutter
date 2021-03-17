import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/constants.dart';
import 'package:hackflix/controllers/backbone_controller.dart';
import 'package:hackflix/controllers/home_controller.dart';
import 'package:hackflix/data/filter.dart';
import 'package:hackflix/screens/home/animated_filter.dart';
import 'package:hackflix/screens/home/preview_movie.dart';
import 'package:hackflix/widgets/backbone.dart';
import 'package:hackflix/widgets/custom_appbar.dart';
import 'package:hackflix/widgets/dropdown_lang.dart';
import 'package:hackflix/widgets/theme_picker.dart';

class Home extends StatelessWidget {
  final BackboneController backboneController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(context) => Obx(
        () => Backbone(
          appBar: _buildAppBar(),
          body: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: backboneController.showAppbar.value! ? 40.0 : 0,
                color: Get.theme!.backgroundColor,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 30.0,
                        child: _buildAppbarSubWidget(),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: homeController.movies.isNotEmpty
                    ? GridView.builder(
                        controller:
                            backboneController.scrollBottomBarController,
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
                        child: Text("NO_MOVIES_HAVE_BEEN_FOUND".tr),
                      ),
              ),
            ],
          ),
          floatingActionButton: AnimatedFilter(
            onClick: () {},
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      );

  CustomAppbar _buildAppBar() {
    return CustomAppbar(
      middleText:
          Filters.FilterMapping[homeController.selectedFilter.value]!.tr,
      appbarSubWidget: _buildAppbarSubWidget(),
      actions: [
        ThemePicker(),
        DropdownLanguage(),
      ],
    );
  }

  Widget _buildAppbarSubWidget() {
    return Obx(
      () => ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ChoiceChip(
            label: Text(Filters.FilterMapping[Filter.popular]!.tr),
            onSelected: (isSelected) => homeController.getPopularMovies(),
            selected: homeController.selectedFilter.value == Filter.popular,
          ),
          SizedBox(width: 10),
          ChoiceChip(
            label: Text(Filters.FilterMapping[Filter.inTheater]!.tr),
            onSelected: (isSelected) => homeController.getInTheaterMovies(),
            selected: homeController.selectedFilter.value == Filter.inTheater,
          ),
          SizedBox(width: 10),
          ChoiceChip(
            label: Text(Filters.FilterMapping[Filter.topRated]!.tr),
            onSelected: (isSelected) => homeController.getTopRatedMovies(),
            selected: homeController.selectedFilter.value == Filter.topRated,
          ),
          SizedBox(width: 10),
          ChoiceChip(
            label: Text(Filters.FilterMapping[Filter.upcoming]!.tr),
            onSelected: (isSelected) => homeController.getUpcomingMovies(),
            selected: homeController.selectedFilter.value == Filter.upcoming,
          ),
        ],
      ),
    );
  }
}
