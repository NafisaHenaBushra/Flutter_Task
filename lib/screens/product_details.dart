import 'package:flutter_task/utils/constants/imports.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  final ProductController productController = Get.find<ProductController>();
  final List interests = [
    'https://img.freepik.com/premium-vector/cute-snowboarder-cartoon_96373-243.jpg?w=2000',
    'https://media.istockphoto.com/vectors/little-happy-boy-on-his-sport-bike-active-lifestyle-cartoon-vector-id518739874?k=20&m=518739874&s=170667a&w=0&h=1YDv6sVgOsJYkBhGmcRPTRN_2zIotc0GzVnFyLu3hWE=',
    'https://previews.123rf.com/images/tigatelu/tigatelu1404/tigatelu140400302/27657197-happy-cartoon-skateboard-boy.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kAppBarHeight),
        child: CustomAppBar(
          title: ksProductDetails,
          onBack: () => Get.back(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomTextField(
              label: ksFindTheProductYouWant,
              suffixIcon: Icons.search,
              textEditingController: productController.searchTextEditingController,
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
                      itemCount: interests.length < 2 ? interests.length : null,
                      itemBuilder: (context, int currentIdx) {
                        int crt = currentIdx % interests.length;
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
                            child: Image.network(interests[crt]),
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
                      controller: PageController(viewportFraction: .8, initialPage: interests.length > 3 ? 0 : 4240),
                    ),
                  ),
                  kH32sizedBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kSmallPaddingUnit * 4),
                    child: Text(
                      'প্রিঞ্জেলস অনিওন চিপস ৪২ গ্রাম',
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
                                text: 'প্রিঞ্জেলস',
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
                                  text: 'মোঃ মোবারাক হোসেন',
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
                                          Text('$ksTk 220', style: titleSemiBoldTextStyle(cSecondaryPk500Color)),
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
                                          Text('$ksTk 220', style: titleMediumTextStyle(cNutralBlack500Color).copyWith(fontSize: kFontSize16)),
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
                                          Text('$ksTk 220', style: titleMediumTextStyle(cNutralBlack500Color).copyWith(fontSize: kFontSize16)),
                                        ],
                                      ),
                                    ),
                                    kH4sizedBox,
                                  ],
                                ),
                              ),
                              kH32sizedBox,
                              Text(ksDetails, style: titleSemiBoldTextStyle(cNutralBlack400Color)),
                              Text(
                                'জীবের মধ্যে সবচেয়ে সম্পূর্ণতা মানুষের। কিন্তু সবচেয়ে অসম্পূর্ণ হয়ে সে জন্মগ্রহণ করে। বাঘ ভালুক তার জীবনযাত্রার পনেরো- আনা মূলধন নিয়ে আসে প্রকৃতির মালখানা থেকে। জীবরঙ্গভূমিতে মানুষ এসে দেখা দেয় দুই শূন্য হাতে মুঠো বেঁধে।',
                                textAlign: TextAlign.justify,
                                style: balooDa2SmallFieldTextStyle(cNutralBlack300Color).copyWith(fontSize: kFontSize16),
                              ),
                            ],
                          ),
                        ),
                        if (productController.count[productController.selectedProductIndex.value].value > 0)
                          Positioned(
                            top: h18 * 2,
                            child: CounterContainer(index: productController.selectedProductIndex.value, maxOrder: 100),
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
                                        if (100 > productController.count[productController.selectedProductIndex.value].value) {
                                          productController.count[productController.selectedProductIndex.value]++;
                                        }
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
