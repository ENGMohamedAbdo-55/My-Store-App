import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/toast/show_toast.dart';
import 'package:my_store/core/routes/app_routs.dart';
import 'package:my_store/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:my_store/core/common/animation/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_linear_button.dart';
import 'package:my_store/core/common/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/language/lang_keys.dart';
import 'package:my_store/core/styles/fonts/font_weight_helper.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userRole) {
            ShowToast.showToastSuccessTop(
              context: context,
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
                context: context, message: context.translate(error),);
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
