import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/animation/animate_do.dart';
import '../../../../../core/common/toast/show_toast.dart';
import '../../../../../core/common/widgets/custom_linear_button.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/app_routs.dart';
import '../../../../../core/styles/fonts/font_weight_helper.dart';
import '../../bloc/auth_bloc_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userRole) {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.loggedSuccessfully),
            
            );
if (userRole == 'admin') {
              context.pushReplacementNamed(AppRouts.homeAdmin);
            } else {
              context.pushReplacementNamed(AppRouts.homeCustomer);
            }
          },
          error: (error) {
            ShowToast.showToastErrorTop(
               message: context.translate(error),);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return CustomFadeInRight(
              duration: 600,
              child: CustomLinearButton(
                onPressed: () {},
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: const CircularProgressIndicator(),
              ),
            );
          },
          orElse: () {
            return CustomFadeInRight(
              duration: 600,
              child: CustomLinearButton(
                onPressed: () {
                  if (context
                      .read<AuthBloc>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<AuthBloc>().add(const AuthBlocEvent.login());
                  }
                },
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: TextApp(
                  text: context.translate(LangKeys.login),
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
