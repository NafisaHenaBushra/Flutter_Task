import 'package:flutter_task/utils/constants/imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    heightWidthKeyboardValue(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHeight),
        child: CustomAppBar(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomTextField(
              label: ksFindTheProductYouWant,
              suffixIcon: Icons.search,
              textEditingController: TextEditingController(),
            ),
          ),
          kH8sizedBox,
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(kHorizontalPadding),
              itemCount: results.length,
              itemBuilder: (context, index) {
                return GridItemCard(index: index);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .59,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridItemCard extends StatelessWidget {
  GridItemCard({
    required this.index,
    super.key,
  });

  final int index;
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    final Map item = results[index];
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: kSmallPaddingUnit * 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: k15BorderRadius,
              color: cWhiteColor,
            ),
            padding: const EdgeInsets.all(kSmallPaddingUnit * 2),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: h20,
                    padding: const EdgeInsets.symmetric(horizontal: kSmallPaddingUnit * 2),
                    decoration: (item['stock'] == 0)
                        ? BoxDecoration(
                            borderRadius: k5BorderRadius,
                            color: cErrorRedShadeColor,
                          )
                        : null,
                    child: (item['stock'] == 0) ? Text(ksStockOut, style: footNoteFieldTextStyle(cErrorR500Color)) : null,
                  ),
                ),
                Image.network(
                  item['image'],
                  height: h20 * 6,
                ),
                kH20sizedBox,
                SizedBox(
                  height: h20 * 2,
                  child: Text(
                    item['product_name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: footNoteFieldTextStyle(cNutralBlack400Color),
                  ),
                ),
                kH8sizedBox,
                Row(
                  children: [
                    SizedBox(
                      width: h20,
                      child: Text(
                        ksBuy,
                        style: balooDa2SmallFieldTextStyle(cNutralBlack300Color),
                      ),
                    ),
                    kW4sizedBox,
                    Text(
                      '$ksTk ${(item['charge']['selling_price'] - item['charge']['profit']).toStringAsFixed(2)}',
                      style: digitBoldFieldTextStyle(cSecondaryPk500Color),
                    ),
                    const Spacer(),
                    Text(
                      '$ksTk ${item['charge']['current_charge'].toStringAsFixed(2)}',
                      style: digitMediumFieldTextStyle(cSecondaryPk500Color).copyWith(decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: h20,
                      child: Text(
                        ksSell,
                        style: balooDa2SmallFieldTextStyle(cNutralBlack300Color),
                      ),
                    ),
                    kW4sizedBox,
                    Text(
                      '$ksTk ${item['charge']['selling_price'].toStringAsFixed(2)}',
                      style: digitBoldFieldTextStyle(cNutralBlack300Color).copyWith(fontWeight: FontWeight.w600, fontSize: kFontSize12),
                    ),
                    const Spacer(),
                    Text(
                      ksProfit,
                      style: balooDa2SmallFieldTextStyle(cNutralBlack300Color),
                    ),
                    kW4sizedBox,
                    Text(
                      '$ksTk ${item['charge']['profit'].toStringAsFixed(2)}',
                      style: digitBoldFieldTextStyle(cNutralBlack300Color).copyWith(fontWeight: FontWeight.w600, fontSize: kFontSize12),
                    ),
                  ],
                ),
                kH20sizedBox,
              ],
            ),
          ),
        ),
        if (item['stock'] != 0)
          Positioned(
            bottom: 0,
            child: Obx(
              () => Container(
                height: h18 * 2,
                decoration: (productController.count[index] == 0)
                    ? null
                    : BoxDecoration(
                        borderRadius: k25BorderRadius,
                        color: const Color(0xffFFCCE4),
                      ),
                padding: EdgeInsets.all(productController.count[index] == 0 ? 0 : kSmallPaddingUnit),
                child: Row(
                  children: [
                    if (productController.count[index] != 0)
                      ClipOval(
                        child: Container(
                          height: h18 * 2,
                          width: h18 * 2 - (kSmallPaddingUnit * 2),
                          color: const Color(0xffFFBFDD),
                          child: TextButton(
                            onPressed: () => productController.count[index]--,
                            style: kTextButtonStyle,
                            child: const Icon(
                              Icons.remove,
                              color: cWhiteColor,
                              size: kIconSize16,
                            ),
                          ),
                        ),
                      ),
                    if (productController.count[index] != 0) kW16sizedBox,
                    if (productController.count[index] != 0)
                      SizedBox(
                        width: h20 * 3,
                        child: Center(
                          child: Text('${productController.count[index]} $ksPiece', style: footNoteFieldTextStyle(cErrorR500Color)),
                        ),
                      ),
                    if (productController.count[index] != 0) kW16sizedBox,
                    ClipOval(
                      child: Container(
                        height: h18 * 2,
                        width: h18 * 2 - (productController.count[index] == 0 ? 0 : (kSmallPaddingUnit * 2)),
                        decoration: const BoxDecoration(gradient: cButtonGradient),
                        child: TextButton(
                          onPressed: () {
                            if (item['maximum_order'] > productController.count[index].value) {
                              productController.count[index]++;
                            }
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
            ),
          ),
      ],
    );
  }
}
