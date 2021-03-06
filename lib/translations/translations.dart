import 'package:get/get.dart';

class TextTransaltions extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
        'fr_BE': {
          'HELLO_WORLD': 'Hello le Monde',
        },
        'en_US': {
          'HELLO_WORLD': 'Hello World',
        }
      };
}