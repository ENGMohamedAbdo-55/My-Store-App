import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/animation/animate_do.dart';
import 'package:my_store/core/common/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/language/lang_keys.dart';
import 'package:my_store/core/routes/app_routs.dart';
import 'package:my_store/core/styles/fonts/font_weight_helper.dart';
import 'package:my_store/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:my_store/features/auth/presentation/widgets/dark_and_lang_buttons.dart';

import 'package:my_store/features/auth/presentation/widgets/signup/sign_up_button.dart';
import 'package:my_store/features/auth/presentation/widgets/signup/sign_up_text_form.dart';
import 'package:my_store/features/auth/presentation/widgets/signup/user_avatar_image.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //! Dark And Lang Buttons
            const DarkAndLangButtons(),
            SizedBox(height: 20.h),
            //! title And Description
            AuthTitleInfo(
              title: context.translate(LangKeys.signUp),
              description: context.translate(LangKeys.signUpWelcome),
            ),
            SizedBox(height: 10.h),

            //! User Avatar
            const UserAvatarImage(),
            SizedBox(height: 15.h),

            //!  SignUp TextForm
            const SignUpTextForm(),
            SizedBox(height: 20.h),

            //! SignUp Button
            const SignUpButton(),
            SizedBox(height: 10.h),
            //! Go to Login Screen
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRouts.login);
                },
                child: TextApp(
                  text: context.translate(LangKeys.youHaveAccount),
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
