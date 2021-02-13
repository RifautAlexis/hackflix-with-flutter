import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hackflix/services/test_provider.dart';

class HomeController extends GetxController {
  final TestProvider testProvider = TestProvider();
  // final movies = List<Movie>.obs;
  final RxString text = "Hello wolrd".obs;

  @override
  Future<void> onInit() async {
    var lol = await testProvider.getMovies();
    print(json.encode(lol));
    super.onInit();
  }

}