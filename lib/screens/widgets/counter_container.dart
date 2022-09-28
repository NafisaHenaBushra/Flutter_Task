import 'package:flutter_task/utils/constants/imports.dart';

class CounterContainer extends StatelessWidget {
  CounterContainer({
    super.key,
    required this.id,
    required this.maxOrder,
  });

  final ProductController productController = Get.find<ProductController>();
  final int id;
  final int maxOrder;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: h18 * 2,
        decoration: (productController.count[id] == 0)
            ? null
            : BoxDecoration(
                borderRadius: k25BorderRadius,
                color: const Color(0xffFFCCE4),
              ),
        padding: EdgeInsets.all(productController.count[id] == 0 ? 0 : kSmallPaddingUnit),
        child: Row(
          children: [
            if (productController.count[id] != 0)
              ClipOval(
                child: Container(
                  height: h18 * 2,
                  width: h18 * 2 - (kSmallPaddingUnit * 2),
                  color: const Color(0xffFFBFDD),
                  child: TextButton(
                    onPressed: () {
                      productController.count[id]--;
                      productController.restoreCounterBox();
                    },
                    style: kTextButtonStyle,
                    child: const Icon(
                      Icons.remove,
                      color: cWhiteColor,
                      size: kIconSize16,
                    ),
                  ),
                ),
              ),
            if (productController.count[id] != 0) kW16sizedBox,
            if (productController.count[id] != 0)
              SizedBox(
                width: h20 * 3,
                child: Center(
                  child: Text('${productController.count[id]} $ksPiece', style: footNoteFieldTextStyle(cErrorR500Color)),
                ),
              ),
            if (productController.count[id] != 0) kW16sizedBox,
            ClipOval(
              child: Container(
                height: h18 * 2,
                width: h18 * 2 - (productController.count[id] == 0 ? 0 : (kSmallPaddingUnit * 2)),
                decoration: const BoxDecoration(gradient: cButtonGradient),
                child: TextButton(
                  onPressed: () {
                    if (maxOrder > productController.count[id].value) {
                      productController.count[id]++;
                    }
                    productController.restoreCounterBox();
                  },
                  style: kTextButtonStyle,
                  child: const Icon(
                    Icons.add,
                    color: cWhiteColor,
                    size: kIconSize16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
