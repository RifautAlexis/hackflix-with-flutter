import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/theme/theme.dart';

class ThemePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Get.isDarkMode ? Icon(Icons.brightness_2) : Icon(Icons.wb_sunny),
      onPressed: () => Get.changeTheme(Get.isDarkMode ? CustomTheme.lightTheme : CustomTheme.darkTheme),
    );
  }
}
