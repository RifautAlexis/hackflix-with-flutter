import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/theme/colors.dart';
import 'package:hackflix/theme/font.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: CustomColors.primaryLight,
      scaffoldBackgroundColor: CustomColors.backgroundColorLight,
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
      primarySwatch: CustomColors.primaryDark,
      scaffoldBackgroundColor: CustomColors.backgroundColorDark,
      fontFamily: CustomFont.fontFamily,
      textTheme: ThemeData.dark().textTheme,
    );
  }
}

extension CustomTextStyles on TextTheme {
  TextStyle get textOverPreviewMovie {
    return Get.isDarkMode
        ? TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: CustomColors.textColorOverPreviewMovieDark,
          )
        : TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: CustomColors.textColorOverPreviewMovieLight,
          );
  }

  TextStyle get titleCustomAppbar {
    return Get.isDarkMode
        ? TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 21,
            shadows: [
              BoxShadow(
                offset: Offset(3, 3),
                color: CustomColors.textColorOverPreviewMovieDark,
                blurRadius: 3.0,
              )
            ],
          )
        : TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 21,
            shadows: [
              BoxShadow(
                offset: Offset(3, 3),
                color: CustomColors.textColorOverPreviewMovieLight,
                blurRadius: 3.0,
              )
            ],
          );
  }
}

extension HandleContext on GetInterface {
  Color changeColors(Color colorDarktheme, Color colorLightheme) {
    return Get.isDarkMode ? colorDarktheme : colorLightheme;
  }

  Icon changeSvg(Icon iconDarktheme, Icon iconLightheme) {
    return Get.isDarkMode ? iconDarktheme : iconLightheme;
  }
}
