import 'package:flutter_task/utils/constants/imports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.action,
    this.onBack,
  }) : super(key: key);

  final dynamic title;
  final List<Widget>? action;
  final Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: cTransparentColor,
      leadingWidth: kCommonBackSpace,
      // centerTitle: true,
      titleSpacing: onBack != null ? 0 : (kSmallPaddingUnit * 5),
      title: title == null
          ? null
          : (title is String)
              ? Text(
                  title,
                  style: titleSemiBoldTextStyle(cNutralBlack400Color),
                )
              : title,
      leading: onBack != null
          ? IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back, size: kIconSize16),
            )
          : null,
      actions: action != null ? [for (var v in action!) v, kW8sizedBox] : null,
    );
  }
}
