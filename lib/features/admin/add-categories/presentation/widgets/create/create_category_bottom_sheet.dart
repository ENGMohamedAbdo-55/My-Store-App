import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/app/upload-image/cubit/upload_image_cubit.dart';
import '../../../../../../core/common/toast/show_toast.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../data/models/create_category_request_body.dart';
import '../../bloc/create-category/create_category_bloc.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/styles/colors/colors_dark.dart';
import '../../../../../../core/styles/fonts/font_family_helper.dart';
import '../../../../../../core/styles/fonts/font_weight_helper.dart';
import 'add_category_upload_image.dart';

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
                BlocBuilder<UploadImageCubit, UploadImageState>(
                  builder: (context, state) {
                    if (context
                        .read<UploadImageCubit>()
                        .getImageUrl
                        .isNotEmpty) {
                      return SizedBox.shrink();
                    }
                    return CustomButton(
                      onPressed: () {
                        context.read<UploadImageCubit>().removeImage();
                      },
                      lastRadius: 10,
                      threeRadius: 10,
                      text: 'Remove',
                      width: 120.w,
                      height: 35.h,
                      backgroundColor: Colors.red,
                    );
                  },
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
            BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();
                    ShowToast.showToastErrorTop(
                      message:
                          '${categoryNameController.text}Created Successfully',
                    );
                  },
                  error: (error) {
                    ShowToast.showToastErrorTop(
                      message: error,
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: ColorsDark.white,
                        borderRadius: BorderRadius.circular(20),
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
                        void validCreateCategory() {}
                      },
                      lastRadius: 20,
                      threeRadius: 20,
                      text: 'Create a new category',
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

  void validCreateCategory(BuildContext context) {
    if (formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().getImageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: context.translate(LangKeys.validPickImage),
        );
      } else {
        context.read<CreateCategoryBloc>().add(
              CreateCategoryEvent.createCategory(
                body: CreateCategoryRequestBody(
                  name: categoryNameController.text.trim(),
                  image: context.read<UploadImageCubit>().getImageUrl,
                ),
              ),
            );
      }
    }
  }
}
