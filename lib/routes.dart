import 'package:get/get.dart';
import 'screens/home/home.dart';
import 'bindings/home_binding.dart';
import 'screens/movie_details.dart/movie_details.dart';

final List<GetPage> routes = [
  GetPage(name: '/', page: () => HomeWidget(), binding: HomeBind(), transition: Transition.zoom,),
  GetPage(name: '/details/:id', page: () => MovieDetailsWidget(), transition: Transition.zoom,),
];
