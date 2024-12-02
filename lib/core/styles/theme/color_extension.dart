import 'package:flutter/material.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/core/styles/colors/colors_light.dart';

class MyColor extends ThemeExtension<MyColor>
{
const  MyColor({required this.mainColor});

  final Color? mainColor;
  @override
  ThemeExtension<MyColor> copyWith({
    Color? mainColor
  }) {
return MyColor(mainColor: mainColor);
  }

  @override
  ThemeExtension<MyColor> lerp(covariant ThemeExtension<MyColor>? other, double t) {
if (other is! MyColor) {
  return this;
} else {
  return MyColor(mainColor: mainColor);
}
  }
  
  static const MyColor dark = MyColor(mainColor: ColorsDark.mainColor);
  static const MyColor light = MyColor(mainColor: ColorsLight.mainColor);
}