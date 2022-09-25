import 'package:flutter_task/common/widgets/app_bar/custom_appbar.dart';
import 'package:flutter_task/common/widgets/textfield/custom_textfield.dart';
import 'package:flutter_task/utils/constants/imports.dart';
import 'package:flutter_task/utils/utility_functions.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              label: ksFindTheProductYouWant,
              suffixIcon: Icons.search,
              textEditingController: TextEditingController(),
            ),
            kH24sizedBox,
            Row(
              children: [
                for (int i = 0; i < 2; i++)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: (i == 0) ? 16.0 : 0),
                      child: Stack(
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
                                      decoration: BoxDecoration(
                                        borderRadius: k5BorderRadius,
                                        color: cErrorRedShadeColor,
                                      ),
                                      child: const Text(ksStockOut),
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/image/potato_chips_PNG79 2.png',
                                    height: h20 * 6,
                                  ),
                                  kH20sizedBox,
                                  Text(
                                    'Lays Classic Family Chips',
                                    style: poppinsMediumFieldTextStyle(cNutralBlack400Color),
                                  ),
                                  kH8sizedBox,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ksBuy,
                                        style: balooDa2SmallFieldTextStyle(cNutralBlack300Color),
                                      ),
                                      kW4sizedBox,
                                      Text(
                                        '৳ 20.00',
                                        style: digitBoldFieldTextStyle(cSecondaryPk500Color),
                                      ),
                                      kW4sizedBox,
                                      Text(
                                        '৳ 22.00',
                                        style: digitMediumFieldTextStyle(cSecondaryPk500Color),
                                      ),
                                    ],
                                  ),
                                  kH20sizedBox,
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: CircleAvatar(
                              radius: h16,
                              child: Icon(
                                Icons.add,
                                color: cWhiteColor,
                                size: kIconSize16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
