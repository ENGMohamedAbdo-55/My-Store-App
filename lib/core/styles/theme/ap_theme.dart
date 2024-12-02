import 'package:flutter/material.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/core/styles/colors/colors_light.dart';
import 'package:my_store/core/styles/theme/color_extension.dart';


import 'package:my_store/core/styles/theme/image_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColor.dark, MyImages.dark],
    useMaterial3: true,
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColor.light, MyImages.light],
    useMaterial3: true,
  );
}
