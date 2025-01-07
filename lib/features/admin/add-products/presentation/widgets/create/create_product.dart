import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/bottom-sheet/custom_bottom_sheet.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/styles/colors/colors_dark.dart';
import '../../../../../../core/styles/fonts/font_family_helper.dart';
import '../../../../../../core/styles/fonts/font_weight_helper.dart';
import 'create_product_bottom_sheet.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      TextApp(
        text: 'Get All Products',
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
            widget: CreateProductBottomSheet(),
          );
        },
        lastRadius: 10,
        threeRadius: 10,
        backgroundColor: ColorsDark.blueDark,
        text: 'Add',
        width: 90.w,
        height: 35.h,
      ),
    ]);
  }
}
