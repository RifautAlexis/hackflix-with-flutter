import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/constants.dart';
import 'package:hackflix/controllers/backbone_controller.dart';
import 'package:hackflix/theme/theme.dart';

class CustomAppbarWidget extends GetView<BackboneController> {
  final Widget? appbarSubWidget;
  final String? middleText;
  final List<Widget> actions;

  CustomAppbarWidget(
      {this.middleText, this.appbarSubWidget, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: controller.showAppbar.value! ? heightAppBar : 0,
        color: Get.theme!.backgroundColor,
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
                  style: Get.textTheme!.titleCustomAppbar,
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [..._buildActions()],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildActions() {
    List<Widget> fittedActions = [];

    for (var index = 0; index < actions.length; index++) {
      fittedActions.add(
        FittedBox(
          child: actions[index],
        ),
      );

      fittedActions.addIf(
        index + 1 < actions.length,
        SizedBox(
          width: 5.0,
        ),
      );
    }

    return fittedActions;
  }
}
