import 'package:flutter/material.dart';
import 'package:my_store/core/styles/theme/color_extension.dart';
import 'package:my_store/core/styles/theme/image_extension.dart';

extension ContextExt on BuildContext {
//?Images
  MyImages get images => Theme.of(this).extension<MyImages>()!;

//?Colors
  MyColor get colors => Theme.of(this).extension<MyColor>()!;

//?Navigator
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  void pop() => Navigator.of(this).pop();
}
