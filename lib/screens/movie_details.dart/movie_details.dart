import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/movie_details_controller.dart';
import 'package:hackflix/data/movie_details.dart';
import 'package:hackflix/widgets/backbone.dart';
import 'package:hackflix/widgets/custom_appbar.dart';
import 'package:hackflix/widgets/dropdown_lang.dart';
import 'package:hackflix/widgets/theme_picker.dart';
import 'package:intl/intl.dart';

class MovieDetailsWidget extends GetView<MovieDetailsController> {
  final int id = int.parse(Get.parameters['id']!);

  @override
  Widget build(BuildContext context) {
    controller.getMovieDetails(id);

    return BackboneWidget(
      appBar: _buildAppBar(),
      body: Obx(() {
        return controller.movieDetails.value == null
            ? Center(child: CircularProgressIndicator())
            : _buildBody();
      }),
    );
  }

  Widget _buildBody() {
    MovieDetails movieDetails = controller.movieDetails.value!;
    double spaceBetweenElements = 12.5;
    double spaceBetweentitleAndData = 10.0;

    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: spaceBetweenElements),
              child: Image.network(
                "https://image.tmdb.org/t/p/original${movieDetails.posterPath}",
              ),
            ),
          ),
          SizedBox(height: spaceBetweenElements),
          Container(
            margin: EdgeInsets.symmetric(vertical: spaceBetweenElements),
            child: Text(movieDetails.originalTitle!),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: spaceBetweenElements),
            child: Text(movieDetails.voteAverage!.toString()),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: spaceBetweenElements),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("LENGTH".tr),
                    SizedBox(height: spaceBetweentitleAndData),
                    Text(movieDetails.runtime!.toString()),
                  ],
                ),
                Column(
                  children: [
                    Text("LANGUAGE".tr),
                    SizedBox(height: spaceBetweentitleAndData),
                    Text(movieDetails.originalLanguage!.toString()),
                  ],
                ),
                Column(
                  children: [
                    Text("YEAR".tr),
                    SizedBox(height: spaceBetweentitleAndData),
                    Text(DateFormat("dd/MM/yyyy")
                        .format(movieDetails.releaseDate!)),
                  ],
                ),
                Column(
                  children: [
                    Text("VOTE_COUNT".tr),
                    SizedBox(height: spaceBetweentitleAndData),
                    Text(movieDetails.voteCount!.toString()),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(spaceBetweenElements),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("STORYLINE".tr),
                SizedBox(height: spaceBetweentitleAndData),
                Text(movieDetails.overview!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CustomAppbarWidget _buildAppBar() {
    return CustomAppbarWidget(
      middleText: "LOL",
      appbarSubWidget: Container(),
      actions: [
        ThemePickerWidget(),
        DropdownLanguageWidget(),
      ],
    );
  }
}
