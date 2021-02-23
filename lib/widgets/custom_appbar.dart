import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/backbone_controller.dart';

class CustomAppbar extends GetView<BackboneController> {
  const CustomAppbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: controller.showAppbar.value ? 100 : 0,
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: NavigationToolbar(
          leading: Navigator.canPop(context)
              ? BackButton(
                  onPressed: () => Get.back(),
                )
              : Container(
                  width: 0,
                  height: 0,
                ),
          middle: Text(
            "Hackflix with Flutter",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 21,
              shadows: [
                BoxShadow(
                  offset: Offset(3, 3),
                  color: Colors.pinkAccent,
                  blurRadius: 3.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
