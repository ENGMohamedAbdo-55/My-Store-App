import 'package:flutter/material.dart';
import 'package:my_store/core/common/screen/under_build_screen.dart';
import 'package:my_store/core/routes/base_routs.dart';

import 'package:my_store/test_one_screen.dart';
import 'package:my_store/test_two_screen.dart';



class AppRouts {
  static const String testOneScreen = 'testOneScreen';
  static const String testTwoScreen = 'TestTwoScreen';

  static Route<void> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case testOneScreen:
        return BaseRoute(page: const TestOneScreen());
      case testTwoScreen:
        return BaseRoute(page: const TestTwoScreen());
      default:
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
