import 'package:flutter_task/utils/constants/imports.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ProductController productController = Get.find<ProductController>();

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
              textEditingController: productController.searchTextEditingController,
            ),
          ),
          kH8sizedBox,
          Expanded(
            child: Obx(
              () => RefreshIndicator(
                color: const Color(0xFF6210E1),
                backgroundColor: cWhiteColor,
                strokeWidth: 2.0,
                onRefresh: () async {
                  productController.searchTextEditingController.clear();
                  await productController.getProductList();
                },
                child: productController.productList.isEmpty
                    ? CustomScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        slivers: [
                          SliverFillRemaining(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: width * .7,
                                  child: Image.asset(kuNoDataView),
                                ),
                                kH24sizedBox,
                                Text(ksNoDataAvailable, style: titleMediumTextStyle(cNutralBlack500Color)),
                              ],
                            ),
                          ),
                        ],
                      )
                    : NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent && !productController.scrolled.value) {
                            productController.scrolled.value = true;
                            productController.getMoreProductList();
                            return true;
                          }
                          return false;
                        },
                        child: GridView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(kHorizontalPadding),
                          itemCount: productController.productList.length,
                          itemBuilder: (context, index) {
                            return productController.isLoadingProductList.value ? const ShimmerListTile() : GridItemCard(index: index);
                          },
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .59,
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                        ),
                      ),
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
    final Map item = productController.productList[index];
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
            child: TextButton(
              onPressed: () {
                productController.selectedProductIndex.value = index;
                Get.toNamed(krProductDetails);
              },
              style: kTextButtonStyle,
              child: Padding(
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
                          '$ksTk ${((item['charge']['selling_price'] ?? 0) - (item['charge']['profit'] ?? 0)).toStringAsFixed(2)}',
                          style: digitBoldFieldTextStyle(cSecondaryPk500Color),
                        ),
                        const Spacer(),
                        Text(
                          '$ksTk ${(item['charge']['current_charge'] ?? 0).toStringAsFixed(2)}',
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
                          '$ksTk ${(item['charge']['selling_price'] ?? 0).toStringAsFixed(2)}',
                          style: digitBoldFieldTextStyle(cNutralBlack300Color).copyWith(fontWeight: FontWeight.w600, fontSize: kFontSize12),
                        ),
                        const Spacer(),
                        Text(
                          ksProfit,
                          style: balooDa2SmallFieldTextStyle(cNutralBlack300Color),
                        ),
                        kW4sizedBox,
                        Text(
                          '$ksTk ${(item['charge']['profit'] ?? 0).toStringAsFixed(2)}',
                          style: digitBoldFieldTextStyle(cNutralBlack300Color).copyWith(fontWeight: FontWeight.w600, fontSize: kFontSize12),
                        ),
                      ],
                    ),
                    kH20sizedBox,
                  ],
                ),
              ),
            ),
          ),
        ),
        if (item['stock'] != 0)
          Positioned(
            bottom: 0,
            child: CounterContainer(index: index, maxOrder: item['maximum_order']),
          ),
      ],
    );
  }
}
