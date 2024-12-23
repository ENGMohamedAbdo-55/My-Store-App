import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/widgets/custom_button.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/common/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/core/styles/fonts/font_family_helper.dart';
import 'package:my_store/core/styles/fonts/font_weight_helper.dart';
import 'package:my_store/features/admin/add-categories/presentation/widgets/create/add_category_upload_image.dart';

class CreateCategoryBottomSheet extends StatefulWidget {
  const CreateCategoryBottomSheet({super.key});

  @override
  State<CreateCategoryBottomSheet> createState() =>
      _CreateCategoryBottomSheetState();
}

class _CreateCategoryBottomSheetState extends State<CreateCategoryBottomSheet> {
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
                text: 'Create Category',
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
                  text: 'Add a photo',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                CustomButton(
                  onPressed: () {},
                  lastRadius: 10,
                  threeRadius: 10,
                  text: 'Remove',
                  width: 120.w,
                  height: 35.h,
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const AddCategoryUploadImage(),
            SizedBox(
              height: 10.h,
            ),
            TextApp(
              text: 'Enter Category Name',
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
              hintText: 'Category Name',
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
              text: 'Create a new category',
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
