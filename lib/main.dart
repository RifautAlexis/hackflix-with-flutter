import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/routes.dart';
import 'package:hackflix/translations/translations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  await DotEnv.load(fileName: "environments/.env");

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: routes,
      // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      translations: TextTransaltions(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'UK'),
    )
  );
}