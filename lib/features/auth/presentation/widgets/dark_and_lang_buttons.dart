import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app/app_cubit/app_cubit.dart';
import '../../../../core/common/animation/animate_do.dart';
import '../../../../core/common/widgets/custom_linear_button.dart';
import '../../../../core/common/widgets/text_app.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/language/app_localization.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/styles/fonts/font_weight_helper.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInRight(
              duration: 400,
              child: CustomLinearButton(
                onPressed: cubit.changeAppThemeMode,
                child: cubit.isDark
                    ? const Icon(Icons.light_mode_rounded, color: Colors.white)
                    : const Icon(
                        Icons.dark_mode_rounded,
                        color: Colors.white,
                      ),
              ),
            );
          },
        ),
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            width: 100.w,
            height: 44.h,
            onPressed: () {
              if(AppLocalizations.of(context)!.isEnLocale){
                cubit.toArabic();
              }else{
                cubit.toEnglish();
              }
            },
            child: TextApp(
              text: context.translate(LangKeys.language),
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
