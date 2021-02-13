import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("${controller.text}")),
      body: Center(
        child: Obx(() => Text("${controller.text}")),
      ));
}
