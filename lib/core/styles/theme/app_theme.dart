import 'package:flutter/material.dart';
import '../colors/colors_dark.dart';
import '../colors/colors_light.dart';
import '../fonts/font_family_helper.dart';
import 'color_extension.dart';

import 'assets_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark, MyAssets.dark],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        color: ColorsDark.white,
        fontSize: 14,
        fontFamily: FontFamilyHelper.getLocalFontFamily(),
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.light, MyAssets.light],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        color: ColorsLight.black,
        fontSize: 14,
        fontFamily: FontFamilyHelper.getLocalFontFamily(),
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
