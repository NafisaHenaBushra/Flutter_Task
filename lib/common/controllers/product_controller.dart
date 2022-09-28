import 'package:flutter_task/utils/constants/imports.dart';

class ProductController extends GetxController {
  final RxList count = RxList();
  final RxInt selectedProductIndex = RxInt(-1);
  final TextEditingController searchTextEditingController = TextEditingController();

  @override
  void onInit() {
    getProductList();
    super.onInit();
  }

  /*
  |--------------------------------------------------------------------------
  | //! info:: get product list api
  |--------------------------------------------------------------------------
  */

  final RxBool isLoadingProductList = RxBool(false);
  final RxList productList = RxList();
  final subLink = Rx<String?>(null);
  final scrolled = RxBool(false);
  Future<dynamic> getProductList() async {
    try {
      final apiController = ApiController();
      isLoadingProductList.value = true;

      var response = await apiController.commonGet(
        url: '$kuFlutterTaskMainUrl$kuProductList&search=${searchTextEditingController.text}',
      );

      if (response['status'] == 'success') {
        Map<String, dynamic> map = response;

        productList.clear();
        count.clear();
        productList.addAll(map['data']['products']['results']);
        count.addAll(RxList<RxInt>.generate(productList.length, (int index) => RxInt(0)));

        // ll(productList.length);
        subLink.value = map['data']['products']['next'];
        if (subLink.value != null) {
          scrolled.value = false;
        } else {
          scrolled.value = true;
        }
        isLoadingProductList.value = false;
        return true;
      } else {
        errorSnackBar(ksError.tr, response['message'], 1500);
        return false;
      }
    } catch (e) {
      ll('getProductList error: $e');
      return false;
    }
  }

  Future<dynamic> getMoreProductList({context, shopId, isFirst, categoryId, isRecommended = false, isPopular = false}) async {
    try {
      final apiController = ApiController();

      if (subLink.value == null) {
        return;
      }

      var response = await apiController.commonGet(
        url: subLink.value!,
      );

      if (response['status'] == 'success') {
        Map<String, dynamic> map = response;

        productList.addAll(map['data']['products']['results']);
        count.addAll(RxList<RxInt>.generate(productList.length, (int index) => RxInt(0)));

        // ll(productList.length);
        subLink.value = map['data']['products']['next'];
        scrolled.value = false;
        return true;
      } else {
        errorSnackBar(ksError.tr, response['message'], 1500);
        return false;
      }
    } catch (e) {
      ll('getMoreCardList error: $e');
      return false;
    }
  }

  /*
  |--------------------------------------------------------------------------
  | //! info:: get product details api
  |--------------------------------------------------------------------------
  */

  final RxMap productDetails = RxMap();
  Future<dynamic> getProductDetails(slug) async {
    try {
      final apiController = ApiController();
      isLoadingProductList.value = true;

      var response = await apiController.commonGet(
        url: kuFlutterTaskMainUrl + kuProductDetails,
      );

      if (response['status'] == 'success') {
        Map<String, dynamic> map = response;

        productDetails.clear();
        productDetails.addAll(map['data']);
        isLoadingProductList.value = false;
        return true;
      } else {
        errorSnackBar(ksError.tr, response['message'], 1500);
        return false;
      }
    } catch (e) {
      ll('getProductDetails error: $e');
      return false;
    }
  }
}
