import 'package:flutter_task/common/widgets/custom_loader.dart';
import 'package:flutter_task/utils/constants/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    dynamic item = productController.productDetails;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kAppBarHeight),
        child: CustomAppBar(
          title: ksProductDetails,
          onBack: () => Get.back(),
        ),
      ),
      body: Obx(
        () => productController.isLoadingProductDetails.value
            ? const ColorLoader(
                colors: [cPrymaryColor, cSecondaryPk500Color, cSuccessColor],
                duration: Duration(milliseconds: 1500),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                    child: CustomTextField(
                      label: ksFindTheProductYouWant,
                      suffixIcon: Icons.search,
                      textEditingController: productController.searchTextEditingController,
                      onSubmit: (v) {
                        unfocus(context);
                        Get.back();
                        productController.getProductList();
                      },
                    ),
                  ),
                  kH8sizedBox,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kH16sizedBox,
                          SizedBox(
                            height: height / 3,
                            child: PageView.builder(
                              itemCount: item['images'].length < 2 ? item['images'].length : null,
                              itemBuilder: (context, int currentIdx) {
                                int crt = currentIdx % item['images'].length as int;
                                // var scale = 1.0;
                                return
                                    // TweenAnimationBuilder(
                                    //   tween: Tween(begin: scale, end: scale),
                                    //   duration: const Duration(milliseconds: 350),
                                    //   child:
                                    Container(
                                  padding: const EdgeInsets.all(kSmallPaddingUnit * 10),
                                  margin: const EdgeInsets.symmetric(horizontal: kSmallPaddingUnit * 4),
                                  decoration: BoxDecoration(color: cWhiteColor, borderRadius: k15BorderRadius),
                                  child: ClipRRect(
                                    borderRadius: k15BorderRadius,
                                    child: item['images'][crt]['image'] == null ? Image.asset(kiNoImage) : Image.network(item['images'][crt]['image']),
                                  ),
                                  // ),
                                  // builder: (context, double value, child) {
                                  //   return Transform.scale(
                                  //     alignment: Alignment.bottomCenter,
                                  //     scale: value,
                                  //     child: child,
                                  //   );
                                  // },
                                );
                              },
                              controller: PageController(
                                viewportFraction: .8,
                                initialPage: item['images'].length > 3 ? 0 : 4240,
                              ),
                            ),
                          ),
                          kH32sizedBox,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: kSmallPaddingUnit * 4),
                            child: Text(
                              item['product_name'] ?? ksNotAvailable,
                              style: titleSemiBoldTextStyle(cNutralBlack500Color).copyWith(fontSize: kFontSize24),
                            ),
                          ),
                          kH4sizedBox,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: kSmallPaddingUnit * 4),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: titleMediumTextStyle(cNutralBlack300Color).copyWith(fontSize: kFontSize14),
                                    children: <TextSpan>[
                                      const TextSpan(text: '$ksBrand '),
                                      TextSpan(
                                        text: item['brand']['name'] ?? ksNotAvailable,
                                        style: titleMediumTextStyle(cNutralBlack500Color).copyWith(fontSize: kFontSize14),
                                      ),
                                    ],
                                  ),
                                ),
                                kW8sizedBox,
                                const CircleAvatar(radius: 3, backgroundColor: cSecondaryPk500Color),
                                kW8sizedBox,
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: titleMediumTextStyle(cNutralBlack300Color).copyWith(fontSize: kFontSize14),
                                      children: <TextSpan>[
                                        const TextSpan(text: '$ksDistributor '),
                                        TextSpan(
                                          text: item['seller'] ?? ksNotAvailable,
                                          style: titleMediumTextStyle(cNutralBlack500Color).copyWith(fontSize: kFontSize14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          kH16sizedBox,
                          Obx(
                            () => Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(color: cWhiteColor, borderRadius: k15BorderRadius),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            kH4sizedBox,
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: kSmallPaddingUnit * 3),
                                              child: Row(
                                                children: [
                                                  Text(ksPurchasePrice, style: titleSemiBoldTextStyle(cSecondaryPk500Color)),
                                                  const Spacer(),
                                                  Text(
                                                    '$ksTk ${((item['charge']['selling_price'] ?? 0) - (item['charge']['profit'] ?? 0)).toStringAsFixed(2)}',
                                                    style: titleSemiBoldTextStyle(cSecondaryPk500Color),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            kH4sizedBox,
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: kSmallPaddingUnit * 3),
                                              child: Row(
                                                children: [
                                                  Text(ksSellingPrice, style: titleMediumTextStyle(cNutralBlack500Color).copyWith(fontSize: kFontSize16)),
                                                  const Spacer(),
                                                  Text(
                                                    '$ksTk ${(item['charge']['selling_price'] ?? 0).toStringAsFixed(2)}',
                                                    style: titleMediumTextStyle(cNutralBlack500Color).copyWith(fontSize: kFontSize16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            kH8sizedBox,
                                            CustomPaint(painter: DashedLinePainter()),
                                            kH4sizedBox,
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: kSmallPaddingUnit * 3),
                                              child: Row(
                                                children: [
                                                  Text('লাভঃ', style: titleMediumTextStyle(cNutralBlack500Color).copyWith(fontSize: kFontSize16)),
                                                  const Spacer(),
                                                  Text(
                                                    '$ksTk ${(item['charge']['profit'] ?? 0).toStringAsFixed(2)}',
                                                    style: titleMediumTextStyle(cNutralBlack500Color).copyWith(fontSize: kFontSize16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            kH4sizedBox,
                                          ],
                                        ),
                                      ),
                                      kH32sizedBox,
                                      Text(ksDetails, style: titleSemiBoldTextStyle(cNutralBlack400Color)),
                                      Html(data: item['description'] ?? '', shrinkWrap: true),
                                    ],
                                  ),
                                ),
                                if (productController.count[productController.selectedProductIndex.value].value > 0)
                                  Positioned(
                                    top: h18 * 2,
                                    child: CounterContainer(index: productController.selectedProductIndex.value, maxOrder: item['maximum_order'] ?? item['stock']),
                                  ),
                                Positioned(
                                  top: 90,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: kSmallPaddingUnit * 4),
                                        child: ClipPath(
                                          clipper: HexagonClipper(),
                                          child: Container(
                                            width: 80,
                                            height: 90,
                                            decoration: const BoxDecoration(gradient: cButtonGradient),
                                            child: TextButton(
                                              onPressed: () {
                                                Get.back();
                                                successSnackBar(ksSuccess, 'প্রোডাক্টটি কেনার জন্য ধন্যবাদ!', 1500);
                                                productController.count[productController.selectedProductIndex.value].value = 0;
                                              },
                                              style: kTextButtonStyle,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    if (productController.count[productController.selectedProductIndex.value].value > 0)
                                                      const Padding(
                                                        padding: EdgeInsets.only(bottom: kSmallPaddingUnit),
                                                        child: Icon(Icons.shopping_cart, color: cWhiteColor, size: kIconSize20),
                                                      ),
                                                    Text(
                                                      productController.count[productController.selectedProductIndex.value].value > 0 ? ksCart : ksBuyIt,
                                                      style: balooDa2SmallFieldTextStyle(cWhiteColor).copyWith(fontSize: kFontSize16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (productController.count[productController.selectedProductIndex.value].value > 0)
                                        Positioned(
                                          right: 0,
                                          top: kSmallPaddingUnit,
                                          child: Container(
                                            height: 31,
                                            width: 31,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffFFCCE4),
                                              border: Border.all(color: cWhiteColor, width: 2),
                                              borderRadius: k20BorderRadius,
                                            ),
                                            child: Center(
                                              child: Text(
                                                productController.count[productController.selectedProductIndex.value].value.toString(),
                                                style: footNoteFieldTextStyle(cErrorR500Color).copyWith(fontSize: kFontSize16),
                                              ),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          kH16sizedBox,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 6, dashSpace = 4, startX = 0;
    final paint = Paint()
      ..color = cNutralBlack300Color.withOpacity(.3)
      ..strokeWidth = 1;
    while (startX < width - 36) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..moveTo(size.width / 2, 0) // moving to topCenter 1st, then draw the path
      ..lineTo(size.width, size.height * .25)
      ..lineTo(size.width, size.height * .75)
      ..lineTo(size.width * .5, size.height)
      ..lineTo(0, size.height * .75)
      ..lineTo(0, size.height * .25)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
