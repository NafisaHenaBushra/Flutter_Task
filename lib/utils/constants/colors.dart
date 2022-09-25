import 'package:flutter/material.dart';

//* In App colors
const Color cPurpleBGP10Color = Color(0xFFF7F2FF);
const Color cWhiteColor = Color(0xFFFFFFFF);
const Color cTextFieldTextColor = Color(0xFF1D1D1D);
const Color cTextFieldHintColor = Color(0xFF989898);
const Color cTextFieldIconColor = Color(0xFFA7A7A7);
const Color cErrorR500Color = Color(0xFFC62828);
const Color cErrorRedShadeColor = Color(0xFFFFCCCC);
const Color cNutralBlack400Color = Color(0xFF323232);
const Color cNutralBlack300Color = Color(0xFF646464);
const Color cSecondaryPk500Color = Color(0xFFDA2079);
const Color cTransparentColor = Colors.transparent;

LinearGradient cButtonGradient = LinearGradient(
    colors: [
      cTransparentColor,
      cTransparentColor,
      const Color(0xFF6210E1).withOpacity(.36),
      const Color(0xFF1400AE),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0, 0, 0.5, 1],
  );