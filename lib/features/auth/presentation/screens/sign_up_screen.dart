import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/auth/presentation/refactor/auth_custom_painter.dart';
import 'package:my_store/features/auth/presentation/refactor/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(
          MediaQuery.of(context).size.width,
          150.h,
        ),
        painter: AuthCustomPainter(
          gradient: LinearGradient(
            colors: [
              context.colors.bluePinkLight!,
              context.colors.bluePinkLight!,
              context.colors.bluePinkLight!,
              context.colors.bluePinkDark!,
            ],
          ),
        ),
      ),
      body: const SafeArea(
        bottom: false,
        child: SignUpBody(),
      ),
    );
  }
}
