import 'package:flutter_task/screens/home_screen.dart';
import 'package:get/get.dart';

const String krHomeScreen = '/home-screen';

List<GetPage<dynamic>>? routes = [
  GetPage(name: krHomeScreen, page: () => HomeScreen(), transition: Transition.noTransition),
];
