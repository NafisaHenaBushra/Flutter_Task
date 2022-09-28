import 'package:flutter_task/utils/constants/imports.dart';

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({
    Key? key,
    this.isGridView = false,
    this.hasLeading = false,
    this.hasSubtitle = false,
    this.hasTitle = false,
    this.hasTrailing = false,
  }) : super(key: key);

  final bool isGridView, hasTitle, hasSubtitle, hasLeading, hasTrailing;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: cWhiteColor,
      highlightColor: Colors.grey[300]!,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: kSmallPaddingUnit * 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: k15BorderRadius,
                color: cWhiteColor.withOpacity(.4),
              ),
              padding: const EdgeInsets.all(kSmallPaddingUnit * 2),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: h20,
                      padding: const EdgeInsets.symmetric(horizontal: kSmallPaddingUnit * 2),
                    ),
                  ),
                  Container(
                    height: h20 * 6,
                    width: h20 * 4,
                    decoration: BoxDecoration(
                      borderRadius: k15BorderRadius,
                      color: cWhiteColor,
                    ),
                  ),
                  kH20sizedBox,
                  SizedBox(
                    height: h20 * 2,
                    child: Text(
                      'Lays Classic Family Chips',
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
                        '$ksTk 20.00',
                        style: digitBoldFieldTextStyle(cSecondaryPk500Color),
                      ),
                      const Spacer(),
                      Text(
                        '$ksTk 22.00',
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
                        '$ksTk 25.00',
                        style: digitBoldFieldTextStyle(cNutralBlack300Color).copyWith(fontWeight: FontWeight.w600, fontSize: kFontSize12),
                      ),
                      const Spacer(),
                      Text(
                        ksProfit,
                        style: balooDa2SmallFieldTextStyle(cNutralBlack300Color),
                      ),
                      kW4sizedBox,
                      Text(
                        '$ksTk 5.00',
                        style: digitBoldFieldTextStyle(cNutralBlack300Color).copyWith(fontWeight: FontWeight.w600, fontSize: kFontSize12),
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
            child: CounterContainer(index: 0, maxOrder: 100),
          ),
        ],
      ),
    );
  }
}
