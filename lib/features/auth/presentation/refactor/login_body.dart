import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/animation/animate_do.dart';
import '../../../../core/common/widgets/text_app.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/routes/app_routs.dart';
import '../../../../core/styles/fonts/font_weight_helper.dart';
import '../widgets/auth_title_info.dart';
import '../widgets/dark_and_lang_buttons.dart';
import '../widgets/login/login_button.dart';
import '../widgets/login/login_text_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //! Dark And Lang Buttons
            const DarkAndLangButtons(),
            SizedBox(height: 50.h),
            //! title And Description
            AuthTitleInfo(
              title: context.translate(LangKeys.login),
              description: context.translate(LangKeys.welcome),
            ),
            SizedBox(height: 30.h),
            //! Login TextForm
            const LoginTextForm(),
            SizedBox(height: 30.h),

            //! Login Button
            const LoginButton(),
            SizedBox(height: 30.h),
            //! Go to SignUp Screen
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRouts.signUp);
                },
                child: TextApp(
                  text: context.translate(LangKeys.createAccount),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.colors.bluePinkLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}