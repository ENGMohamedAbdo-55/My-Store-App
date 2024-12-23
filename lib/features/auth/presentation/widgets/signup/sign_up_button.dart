import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app/upload-image/cubit/upload_image_cubit.dart';
import '../../../../../core/common/animation/animate_do.dart';
import '../../../../../core/common/toast/show_toast.dart';
import '../../../../../core/common/widgets/custom_linear_button.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/app_routs.dart';
import '../../../../../core/styles/fonts/font_weight_helper.dart';
import '../../bloc/auth_bloc_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.loggedSuccessfully),
            );
            context.pushNamedAndRemoveUntil(AppRouts.homeCustomer);
          },
          error: (message) {
            ShowToast.showToastErrorTop(
              message: context.translate(message),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return CustomLinearButton(
              onPressed: () {},
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
          orElse: () {
            return CustomFadeInRight(
              duration: 600,
              child: CustomLinearButton(
                onPressed: () {
                  _validateThenDoSignUp(context);
                },
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: TextApp(
                  text: context.translate(LangKeys.signUp),
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

  void _validateThenDoSignUp(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final imageCubit = context.read<UploadImageCubit>();

    if (!authBloc.formKey.currentState!.validate() ||
        imageCubit.getImageUrl.isEmpty) {
      if (imageCubit.getImageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: context.translate(LangKeys.validPickImage),
        );
      }
    } else {
      context.read<AuthBloc>().add(
            AuthBlocEvent.signUp(
              imagUrl: imageCubit.getImageUrl,
            ),
          );
    }
  }
}
