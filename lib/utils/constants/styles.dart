import 'package:flutter_task/utils/constants/imports.dart';

TextStyle textFieldTextStyle(Color color) {
  return TextStyle(fontFamily: ksBalooDa2, fontWeight: FontWeight.w500, fontSize: kFontSize12, color: color);
}

TextStyle footNoteFieldTextStyle(Color color) {
  return TextStyle(fontFamily: ksBalooDa2, fontWeight: FontWeight.w500, fontSize: kFontSize14, color: color);
}

TextStyle balooDa2SmallFieldTextStyle(Color color) {
  return TextStyle(fontFamily: ksBalooDa2, fontWeight: FontWeight.w400, fontSize: kFontSize8, color: color);
}

TextStyle titleSemiBoldTextStyle(Color color) {
  return TextStyle(fontFamily: ksBalooDa2, fontWeight: FontWeight.w600, fontSize: kFontSize20, color: color);
}

TextStyle titleMediumTextStyle(Color color) {
  return TextStyle(fontFamily: ksBalooDa2, fontWeight: FontWeight.w500, fontSize: kFontSize20, color: color);
}

TextStyle poppinsMediumFieldTextStyle(Color color) {
  return TextStyle(fontFamily: ksPoppins, fontWeight: FontWeight.w500, fontSize: kFontSize14, color: color);
}

TextStyle digitBoldFieldTextStyle(Color color) {
  return TextStyle(fontFamily: ksPoppins, fontWeight: FontWeight.w700, fontSize: kFontSize16, color: color);
}

TextStyle digitMediumFieldTextStyle(Color color) {
  return TextStyle(fontFamily: ksPoppins, fontWeight: FontWeight.w500, fontSize: kFontSize12, color: color);
}

//* info: remove extra padding from TextButton
ButtonStyle? kTextButtonStyle = TextButton.styleFrom(
  padding: EdgeInsets.zero,
  minimumSize: Size.zero,
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  splashFactory: InkSplash.splashFactory,
).copyWith(overlayColor: MaterialStateProperty.all(cPurpleBGP10Color.withOpacity(.2)));
