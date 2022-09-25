// import 'package:crg_flutter_app/utils/constants/imports.dart';

// class CustomListTile extends StatelessWidget {
//   const CustomListTile({
//     Key? key,
//     this.title,
//     this.subtitle,
//     this.onPressed,
//     this.leading,
//     this.trailing,
//     this.itemColor = cWhiteColor,
//     this.borderColor = cTransparentColor,
//     this.isNew = false,
//   }) : super(key: key);

//   final dynamic title, subtitle;
//   final Function()? onPressed;
//   final Widget? leading, trailing;
//   final Color itemColor, borderColor;
//   final bool isNew;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: const BoxConstraints(minHeight: kSmallListItemHeight),
//       decoration: BoxDecoration(
//         color: itemColor,
//         border: Border.all(color: borderColor, width: 1),
//         borderRadius: k10BorderRadius,
//       ),
//       width: width,
//       child: ClipRRect(
//         borderRadius: k10BorderRadius,
//         child: TextButton(
//           style: kTextButtonStyle,
//           onPressed: onPressed,
//           child: Padding(
//             padding: const EdgeInsets.all(kSmallPaddingUnit * 3),
//             child: Row(
//               children: [
//                 if (leading != null)
//                   Padding(
//                     padding: const EdgeInsets.only(right: kSmallPaddingUnit * 3),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         leading!,
//                         if (isNew) const CircleAvatar(backgroundColor: cPrimaryColor, radius: kDotIndicatorDiameter * .5),
//                       ],
//                     ),
//                   ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if (title != null)
//                         (title is String)
//                             ? Text(
//                                 title,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: smallSubTitleTextStyle(cMainBlackColor),
//                               )
//                             : title,
//                       if (subtitle != null)
//                         (subtitle is String)
//                             ? Padding(
//                                 padding: const EdgeInsets.only(top: kSmallPaddingUnit),
//                                 child: Text(
//                                   subtitle,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: smallBodyTextStyle(cGrey1Color),
//                                 ),
//                               )
//                             : subtitle,
//                     ],
//                   ),
//                 ),
//                 if (trailing != null)
//                   Padding(
//                     padding: const EdgeInsets.only(left: kSmallPaddingUnit * 3),
//                     child: trailing!,
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
