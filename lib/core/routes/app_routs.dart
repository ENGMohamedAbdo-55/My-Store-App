import 'package:flutter/material.dart';
import 'package:my_store/core/common/screen/under_build_screen.dart';
import 'package:my_store/core/routes/base_routs.dart';
import 'package:my_store/features/auth/presentation/screens/login_screen.dart';
import 'package:my_store/features/auth/presentation/screens/sign_up_screen.dart';




class AppRouts {
  static const String login = 'login';
  static const String signUp = 'signUp';


  static Route<void> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return BaseRoute(page: const LoginScreen());
      case signUp:
        return BaseRoute(page: const SignUpScreen());
      default:
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
