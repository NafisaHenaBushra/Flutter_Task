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
