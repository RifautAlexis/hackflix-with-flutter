import 'package:flutter/material.dart';

class CustomColors {
  // Light theme
  static final MaterialColor primaryLight = Colors.purple;
  static final Color primaryLightContrast01 = primaryLight.shade300;
  static const Color backgroundColorLight = Colors.white;
  static const Color disabledColor = Colors.grey;
  static const Color selectedColor = Colors.greenAccent;
  static const Color selectedTextColor = Colors.black;
  static const Color unselectedTextColor = Colors.white;
  static const Color unknownColor = Colors.pink;
  static const Color textColorOverPreviewMovieLight = Colors.pinkAccent;

  // Dark theme
  static final MaterialColor primaryDark = Colors.grey;
  static final Color primaryDarkContrast01 = primaryDark.shade800;
  static const Color backgroundColorDark = Colors.black;
  static const Color textColorOverPreviewMovieDark = Colors.redAccent;
}