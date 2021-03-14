import 'package:flutter/material.dart';
import 'package:hackflix/theme/colors.dart';
import 'package:hackflix/theme/font.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: CustomColors.primaryLight,
      scaffoldBackgroundColor: CustomColors.backgroundColor,
      fontFamily: CustomFont.fontFamily,
      textTheme: ThemeData.light().textTheme,
      chipTheme: ChipThemeData(
        backgroundColor: CustomColors.primaryLight,
        disabledColor: CustomColors.disabledColor,
        selectedColor: CustomColors.selectedColor,
        secondarySelectedColor: CustomColors.selectedColor,
        padding: EdgeInsets.all(0.0),
        labelStyle: TextStyle(color: CustomColors.unselectedTextColor),
        secondaryLabelStyle: TextStyle(color: CustomColors.selectedTextColor),
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: CustomFont.fontFamily,
        textTheme: ThemeData.dark().textTheme);
  }
}
