import 'package:flutter_task/screens/home_screen.dart';
import 'package:flutter_task/screens/product_details.dart';
import 'package:get/get.dart';

const String krHomeScreen = '/home-screen';
const String krProductDetails = '/product-details';

List<GetPage<dynamic>>? routes = [
  GetPage(name: krHomeScreen, page: () => HomeScreen(), transition: Transition.noTransition),
  GetPage(name: krProductDetails, page: () => ProductDetails(), transition: Transition.noTransition),
];
