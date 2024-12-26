import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/app/upload-image/cubit/upload_image_cubit.dart';
import '../../../../../../core/common/toast/show_toast.dart';
import '../../../data/models/update_category_request_body.dart';
import '../../bloc/update-category/update_categories_bloc.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/styles/colors/colors_dark.dart';
import '../../../../../../core/styles/fonts/font_family_helper.dart';
import '../../../../../../core/styles/fonts/font_weight_helper.dart';

import 'update_categories_image.dart';

class UpdateCategoriesBottomSheet extends StatefulWidget {
  const UpdateCategoriesBottomSheet(
      {super.key,
      required this.categoryId,
      required this.categoryName,
      required this.imageUrl});
  final String categoryId;
  final String categoryName;
  final String imageUrl;
  @override
  State<UpdateCategoriesBottomSheet> createState() =>
      _UpdateCategoriesBottomSheetState();
}

class _UpdateCategoriesBottomSheetState
    extends State<UpdateCategoriesBottomSheet> {
  final formKey = GlobalKey<FormState>();
  TextEditingController categoryNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    categoryNameController.text = widget.categoryName;
  }

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
            UpdateCategoriesImage(imageUrl: widget.imageUrl),
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
            BlocConsumer<UploadImageCubit, UploadImageState>(
              listener: (context, state) {
                state.whenOrNull(success: () {
                  context.pop();
                  ShowToast.showToastSuccessTop(
                    message:
                        '${categoryNameController.text}Update Successfully',
                  );
                }, error: (error) {
                  ShowToast.showToastErrorTop(
                    message: '',
                  );
                });
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorsDark.blueDark,
                        ),
                      ),
                    );
                  },
                  orElse: () {
                    return CustomButton(
                      onPressed: () {
                        _validateUpdateCategory(context);
                      },
                      lastRadius: 20,
                      threeRadius: 20,
                      text: 'Update this category',
                      textColor: ColorsDark.blueDark,
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      backgroundColor: ColorsDark.white,
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }

  void _validateUpdateCategory(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context
          .read<UpdateCategoriesBloc>()
          .add(UpdateCategoriesEvent.updateCategory(
            body: UpdateCategoryRequestBody(
              name: categoryNameController.text.trim(),
              image: context.read<UploadImageCubit>().getImageUrl.isEmpty
                  ? widget.imageUrl
                  : context.read<UploadImageCubit>().getImageUrl,
              id: widget.categoryId,
            ),
          ));
    }
  }
}
