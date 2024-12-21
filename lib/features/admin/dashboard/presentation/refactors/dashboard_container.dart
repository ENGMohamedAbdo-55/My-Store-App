import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/loading/loading_shimmer.dart';
import '../../../../../core/common/widgets/custom_container_linear_admin.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/styles/fonts/font_family_helper.dart';
import '../../../../../core/styles/fonts/font_weight_helper.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({
    required this.title,
    required this.number,
    required this.image,
    required this.isLoading,
    super.key,
  });
  final String title;
  final String number;
  final String image;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: title,
                  theme: context.textStyle.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeightHelper.bold,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  ),
                ),
                const Spacer(),
                if (isLoading)
                  LoadingShimmer(
                    height: 30.h,
                    width: 100.w,
                  )
                else
                  TextApp(
                    text: number,
                    theme: context.textStyle.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeightHelper.bold,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                    ),
                  ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 90,child: Image.asset(image),)
          ],
        ),
      ),
    );
  }
}
