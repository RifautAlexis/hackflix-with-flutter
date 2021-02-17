import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: routes,
      // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
    )
  );
}