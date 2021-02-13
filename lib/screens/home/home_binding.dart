import 'package:get/get.dart';
import 'package:hackflix/controllers/home_controller.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}