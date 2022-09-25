import 'package:flutter_task/utils/constants/imports.dart';

class BinderController implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductController(), permanent: true);
  }
}
