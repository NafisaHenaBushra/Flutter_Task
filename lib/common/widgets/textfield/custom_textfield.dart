import 'package:flutter_task/utils/constants/imports.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final bool autoFocus, obscureText, readOnly, isSearch, enabled;
  final TextEditingController textEditingController;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final ValueChanged<String>? onSubmit;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength, maxLines;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final Function()? onSuffixPress;
  final IconData? suffixIcon;

  const CustomTextField({
    this.label,
    this.suffixIcon,
    this.onSuffixPress,
    this.autoFocus = false,
    this.enabled = true,
    this.isSearch = false,
    this.obscureText = false,
    this.readOnly = false,
    this.focusNode,
    this.maxLength = 256,
    this.maxLines = 1,
    this.inputFormatters = const [],
    required this.textEditingController,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.onSubmit,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      textAlign: TextAlign.start,
      textCapitalization: TextCapitalization.sentences,
      style: textFieldTextStyle(cTextFieldTextColor),
      readOnly: readOnly,
      focusNode: focusNode,
      autofocus: autoFocus,
      maxLength: maxLength,
      maxLines: maxLines,
      controller: textEditingController,
      cursorColor: cTextFieldTextColor,
      decoration: InputDecoration(
        enabled: enabled,
        filled: true,
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                size: kIconSize20,
                color: cTextFieldIconColor,
              )
            : null,
        fillColor: cWhiteColor,
        alignLabelWithHint: true, // This is necessary if the maxLines is greater than line 1.
        hintText: label,
        hintStyle: textFieldTextStyle(cTextFieldHintColor),
        counter: const SizedBox.shrink(),
        contentPadding: const EdgeInsets.symmetric(horizontal: kSmallPaddingUnit * 4, vertical: kSmallPaddingUnit * 2),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: k15BorderRadius,
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: k15BorderRadius,
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: k15BorderRadius,
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      autocorrect: false,
      keyboardType: inputType,
      textInputAction: inputAction,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
    );
  }
}
