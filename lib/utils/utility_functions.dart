import 'dart:developer';
import 'package:flutter_task/utils/constants/imports.dart';

void heightWidthKeyboardValue(context) {
  height = MediaQuery.of(context).size.height;
  width = MediaQuery.of(context).size.width;
  keyboardValue = MediaQuery.of(context).viewInsets.bottom;
}

double getTopPadding(context) => MediaQuery.of(context).padding.top;

void unfocus(context) {
  FocusScope.of(context).unfocus();
}

void ll(message) {
  log(message.toString());
}

void errorSnackBar(title, message, duration) {
  Get.snackbar(
    title,
    message,
    backgroundColor: cErrorR500Color,
    colorText: cWhiteColor,
    maxWidth: 400,
    duration: Duration(milliseconds: duration),
  );
}

void successSnackBar(title, message, duration) {
  Get.snackbar(
    title,
    message,
    backgroundColor: cSuccessColor,
    colorText: cWhiteColor,
    maxWidth: 400,
    duration: Duration(milliseconds: duration),
  );
}
