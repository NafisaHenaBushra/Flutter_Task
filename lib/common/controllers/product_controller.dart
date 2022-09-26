import 'package:flutter_task/utils/constants/imports.dart';

class ProductController extends GetxController {
  final List count = List<RxInt>.generate(results.length, (int index) => RxInt(0));
}
