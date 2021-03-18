import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BackboneController extends GetxController {
  RxBool showAppbar = true.obs;
  ScrollController scrollBottomBarController = ScrollController();
  bool isScrollingDown = false;

  @override
  void onInit() {
    myScroll();
    super.onInit();
  }

  @override
  void onClose() {
    this.scrollBottomBarController.removeListener(() {});
    super.onClose();
  }

  void myScroll() async {
    scrollBottomBarController.addListener(() {
      if (scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          showAppbar.value = false;
        }
      }
      if (scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showAppbar.value = true;
        }
      }
    });
  }
}
