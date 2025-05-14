import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/animation/animate_do.dart';
import '../../../../core/common/widgets/text_app.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/styles/fonts/font_weight_helper.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeightHelper.bold,
              color: context.colors.textColor,
            ),
          ),
          SizedBox(height: 10.h),
          TextApp(
            text: description,
            theme: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.medium,
              color: context.colors.textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
