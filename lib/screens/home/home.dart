import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/home_controller.dart';
import 'package:hackflix/widgets/backbone.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(context) => Backbone(
        body: Obx(
          () => Column(
            children: [
              Flexible(
                child: GridView.builder(
                    padding: EdgeInsets.all(10.0),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    itemCount: controller.popularMovies.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: () =>
                            print("On Tap"), // Get.toNamed("/details"),
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
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.dstATop),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: controller.popularMovies.length,
              //   itemBuilder: (_, int index) => Container(
              //     width: 100,
              //     height: 100,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(4)),
              //       shape: BoxShape.rectangle,
              //       border: Border.all(
              //         color: Colors.blue,
              //         width: 4,
              //       ),
              //       // image: DecorationImage(
              //       //   image: NetworkImage(
              //       //       "https://image.tmdb.org/t/p/original${controller.popularMovies[index].posterPath}"),
              //       //   fit: BoxFit.cover,
              //       // ),
              //     ),
              //     child: Obx(
              //       () => Text(
              //           "https://image.tmdb.org/t/p/original${controller.popularMovies[index].posterPath}"),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
}
