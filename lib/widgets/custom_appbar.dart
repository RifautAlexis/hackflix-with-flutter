import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/backbone_controller.dart';
import 'package:hackflix/widgets/dropdown_lang.dart';

class CustomAppbar extends GetView<BackboneController> {
  final Widget? appbarSubWidget;
  final String? middleText;
  final List<Widget> actions;

  CustomAppbar(
      {this.middleText, this.appbarSubWidget, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: controller.showAppbar.value! ? 100 : 0,
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
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
                  middleText!,
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
                trailing: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...actions,
                    ],
                  ),
                ),
              ),
            ),
            ..._buildAppbarSubWidget(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAppbarSubWidget() {
    if (appbarSubWidget == null) {
      return [
        Container(
          width: 0,
          height: 0,
        )
      ];
    }

    return [
      Divider(
        color: Colors.grey,
        thickness: 1,
        height: 0,
      ),
      Expanded(
        child: appbarSubWidget!,
      )
    ];
  }
}
