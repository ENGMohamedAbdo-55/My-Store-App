import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/bottom-sheet/custom_bottom_sheet.dart';
import 'package:my_store/core/common/dialogs/custom_dialogs.dart';
import 'package:my_store/core/common/widgets/custom_button.dart';
import 'package:my_store/core/common/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/core/styles/fonts/font_family_helper.dart';
import 'package:my_store/core/styles/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/add-categories/presentation/widgets/create/create_category_bottom_sheet.dart';

class CreateCategoriesButton extends StatelessWidget {
  const CreateCategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Categories',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showCustomBottomSheet(
              context: context,
              widget: const CreateCategoryBottomSheet(),
            );
          },
          lastRadius: 10,
          threeRadius: 10,
          backgroundColor: ColorsDark.blueDark,
          text: 'Add',
          width: 90.w,
          height: 35.h,
        ),
      ],
    );
  }
}
