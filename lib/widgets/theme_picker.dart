import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/theme/theme.dart';

class ThemePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Get.isDarkMode ? Icon(Icons.brightness_2) : Icon(Icons.wb_sunny),
      onTap: () => Get.changeTheme(Get.isDarkMode ? CustomTheme.lightTheme : CustomTheme.darkTheme),
    );
  }
}
