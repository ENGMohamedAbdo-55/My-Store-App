import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/styles/colors/colors_dark.dart';
import '../../../../../../core/styles/fonts/font_family_helper.dart';
import '../../../../../../core/styles/fonts/font_weight_helper.dart';
import '../create/add_category_upload_image.dart';
import 'update_categories_image.dart';

class UpdateCategoriesBottomSheet extends StatefulWidget {
  const UpdateCategoriesBottomSheet({super.key});

  @override
  State<UpdateCategoriesBottomSheet> createState() =>
      _UpdateCategoriesBottomSheetState();
}

class _UpdateCategoriesBottomSheetState
    extends State<UpdateCategoriesBottomSheet> {
  final formKey = GlobalKey<FormState>();
  TextEditingController categoryNameController = TextEditingController();
  @override
  void dispose() {
    categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextApp(
                text: 'Update Category',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: 'Update a photo',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const UpdateCategoriesImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1731872468251-e630bf9d0f4e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDQ4fGFldTZyTC1qNmV3fHxlbnwwfHx8fHw%3D'),
            SizedBox(
              height: 10.h,
            ),
            TextApp(
              text: 'Update Category Name',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
              controller: categoryNameController,
              keyboardType: TextInputType.emailAddress,
              hintText: ' category Name',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 3) {
                  return 'Please enter category name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onPressed: () {},
              lastRadius: 20,
              threeRadius: 20,
              text: 'Update this category',
              textColor: ColorsDark.blueDark,
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              backgroundColor: ColorsDark.white,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
