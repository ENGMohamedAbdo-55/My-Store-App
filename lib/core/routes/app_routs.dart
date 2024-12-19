import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/upload-image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/di/injection_container.dart';
import 'package:my_store/features/admin/home_admin.dart';
import 'package:my_store/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:my_store/features/customer/home_customer.dart';
import 'package:my_store/core/common/screen/under_build_screen.dart';
import 'package:my_store/core/routes/base_routs.dart';
import 'package:my_store/features/auth/presentation/screens/login_screen.dart';
import 'package:my_store/features/auth/presentation/screens/sign_up_screen.dart';

class AppRouts {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String homeAdmin = 'homeAdmin';
  static const String homeCustomer = 'homeCustomer';

  static Route<void> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case signUp:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<UploadImageCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<AuthBloc>(),
              ),
            ],
            child: const SignUpScreen(),
          ),
        );
      case homeAdmin:
        return BaseRoute(
          page: const HomeAdmin(),
        );
      case homeCustomer:
        return BaseRoute(
          page: const HomeCustomer(),
        );
      default:
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
