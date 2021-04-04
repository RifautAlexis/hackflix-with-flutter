import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/movie_details_controller.dart';
import 'package:hackflix/data/language.dart';
import 'package:hackflix/data/movie_details.dart';
import 'package:hackflix/widgets/backbone.dart';
import 'package:hackflix/widgets/custom_appbar.dart';
import 'package:hackflix/widgets/dropdown_lang.dart';
import 'package:hackflix/widgets/theme_picker.dart';
import 'package:intl/intl.dart';

class MovieDetailsWidget extends GetView<MovieDetailsController> {
  final int id = int.parse(Get.parameters['id']!);
  final double spaceBetweenElements = 12.5;
  final double spaceBetweentitleAndData = 10.0;
  MovieDetails? movieDetails;

  @override
  Widget build(BuildContext context) {
    controller.getMovieDetails(id);

    return BackboneWidget(
      appBar: _buildAppBar(),
      body: Obx(() {
        movieDetails = controller.movieDetails.value;
        return movieDetails == null
            ? Center(child: CircularProgressIndicator())
            : _buildBody();
      }),
    );
  }

  Widget _buildBody() {
    // MovieDetails movieDetails = controller.movieDetails.value!;

    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(top: spaceBetweenElements),
              child: Image.network(
                "https://image.tmdb.org/t/p/original${movieDetails!.posterPath}",
              ),
            ),
          ),
          SizedBox(height: spaceBetweenElements),
          Container(
            margin: EdgeInsets.symmetric(vertical: spaceBetweenElements),
            child: Text(
              movieDetails!.originalTitle!,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: spaceBetweenElements),
            child: Text(
              '${movieDetails!.voteAverage!}/10',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Container(
            height: 50.0,
            margin: EdgeInsets.symmetric(vertical: spaceBetweenElements),
            child: _buildDetails(),
          ),
          Container(
            margin: EdgeInsets.all(spaceBetweenElements),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "STORYLINE".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: spaceBetweentitleAndData),
                Text(
                  movieDetails!.overview!,
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "LENGTH".tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              movieDetails!.runtime!.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "LANGUAGE".tr,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 25.0,
              width: 25.0,
              child: _buildFlagLanguage(movieDetails!),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "YEAR".tr,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat("dd/MM/yyyy").format(movieDetails!.releaseDate!),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "VOTE_COUNT".tr,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              movieDetails!.voteCount!.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  SvgPicture _buildFlagLanguage(MovieDetails movieDetails) {
    Language language = Language.languages
        .firstWhere((lang) => lang.language == movieDetails.originalLanguage);

    return SvgPicture.asset(
      language.flagPath!,
      semanticsLabel: language.label,
    );
  }

  CustomAppbarWidget _buildAppBar() {
    return CustomAppbarWidget(
      middleText: "",
      appbarSubWidget: Container(),
      actions: [
        ThemePickerWidget(),
        DropdownLanguageWidget(),
      ],
    );
  }
}
