import 'package:flutter/material.dart';
import 'package:my_store/core/common/screen/under_build_screen.dart';
import 'package:my_store/core/routes/base_routs.dart';
import 'package:my_store/features/auth/presentation/screens/login_screen.dart';




class AppRouts {
  static const String login = 'login';


  static Route<void> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return BaseRoute(page: const LoginScreen());
      // case testTwoScreen:
      //   return BaseRoute(page: const TestTwoScreen());
      default:
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
