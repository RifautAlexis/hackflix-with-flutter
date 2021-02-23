import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hackflix/controllers/backbone_controller.dart';

class Backbone extends GetView<BackboneController> {
  const Backbone({this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AnimatedContainer(
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
        ),
        body: SafeArea(
          child: this.body,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.pink,
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("Float action button pressed"),
          child: Icon(Icons.notifications),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
