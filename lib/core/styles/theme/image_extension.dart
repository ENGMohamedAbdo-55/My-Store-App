import 'package:flutter/material.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/core/styles/colors/colors_light.dart';
import 'package:my_store/core/styles/images/app_images.dart';

class MyImages extends ThemeExtension<MyImages>
{
const  MyImages({required this.testImage});

  final String? testImage;
  @override
  ThemeExtension<MyImages> copyWith({
    String? testImage
  }) {
return MyImages(testImage: testImage);
  }

  @override
  ThemeExtension<MyImages> lerp(covariant ThemeExtension<MyImages>? other, double t) {
if (other is! MyImages) {
  return this;
} else {
  return MyImages(testImage: testImage);
}
  }
  
  static const MyImages dark = MyImages(testImage: AppImages.darkImage);
  static const MyImages light = MyImages(testImage: AppImages.lightImage);
}