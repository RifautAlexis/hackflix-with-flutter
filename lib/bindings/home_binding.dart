import 'package:get/get.dart';
import 'package:hackflix/controllers/backbone_controller.dart';
import 'package:hackflix/controllers/home_controller.dart';
import 'package:hackflix/controllers/language_controller.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<BackboneController>(() => BackboneController());
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}