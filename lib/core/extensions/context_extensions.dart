import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
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