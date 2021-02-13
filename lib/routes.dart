import 'package:get/get.dart';

import 'screens/home/home.dart';
import 'screens/home/home_binding.dart';

final List<GetPage> routes = [
  GetPage(name: '/', page: () => Home(), binding: HomeBind(), transition: Transition.zoom,),
];
