import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/routes.dart';
import 'package:hackflix/theme/theme.dart';
import 'package:hackflix/translations/translations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  await DotEnv.load(fileName: "environments/.env");

  runApp(
    GetMaterialApp(
      theme: CustomTheme.lightTheme,
      initialRoute: '/',
      getPages: routes,
      // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      translations: TextTransaltions(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'UK'),
    )
  );
}