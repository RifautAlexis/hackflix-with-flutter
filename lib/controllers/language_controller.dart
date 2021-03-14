import 'package:get/get.dart';
import 'package:hackflix/data/language.dart';

class LanguageController extends GetxController {
  var currentLanguage = Language.initializer().obs;

  @override
  void onInit() {
    currentLanguage.value = Language.languages.firstWhere((element) => element.getLanguageCode() == Get.deviceLocale.toString());
    super.onInit();
  }

  void setLanguage(Language selectedLanguage) {
    currentLanguage.value = selectedLanguage;
    Get.updateLocale(selectedLanguage.locale!);
  }
}