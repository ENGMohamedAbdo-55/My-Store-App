import 'package:flutter/material.dart';
import 'package:my_store/core/language/app_localization.dart';
import 'package:my_store/core/styles/theme/color_extension.dart';
import 'package:my_store/core/styles/theme/assets_extension.dart';

extension ContextExt on BuildContext {
//?Images
  MyAssets get images => Theme.of(this).extension<MyAssets>()!;

//?Colors
  MyColors get colors => Theme.of(this).extension<MyColors>()!;

//?Language
  String translate(String langKey) {
    return AppLocalizations.of(this)!.translate(langKey).toString();
  }

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
