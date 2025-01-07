import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/dialogs/custom_dialogs.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_drop_down.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/styles/colors/colors_dark.dart';
import '../../../../../../core/styles/fonts/font_family_helper.dart';
import '../../../../../../core/styles/fonts/font_weight_helper.dart';
import 'update_product_images.dart';

class UpdateProductBottomSheet extends StatefulWidget {
  const UpdateProductBottomSheet({super.key});

  @override
  State<UpdateProductBottomSheet> createState() =>
      _UpdateProductBottomSheetState();
}

class _UpdateProductBottomSheetState extends State<UpdateProductBottomSheet> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String? categoryName;
  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Title Update Product
              Center(
                child: TextApp(
                  text: 'Update Product',
                  theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeightHelper.bold,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextApp(
                  text: 'Update a photos',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  )),
              SizedBox(
                height: 15.h,
              ),
              UpdateProductImages(),
              SizedBox(
                height: 15.h,
              ),
              //! Title
              TextApp(
                text: 'Title',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                controller: titleController,
                hintText: 'title',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Please enter your Product title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              TextApp(
                text: 'Price',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                controller: priceController,
                hintText: 'price',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Product title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              TextApp(
                text: 'Description',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                controller: titleController,
                hintText: 'description',
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Please enter your Product title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              TextApp(
                text: 'Category',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomCreateDropDown(
                hintText: 'Choose category',
                items: ['electronic', 'clothes', 'shoes'],
                onChanged: (value) {
                  setState(() {
                    categoryName = value;
                  });
                },
                value: categoryName,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomButton(
                text: 'Update Product',
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                textColor: ColorsDark.blueDark,
                threeRadius: 20,
                lastRadius: 20,
                backgroundColor: ColorsDark.white,
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ))),
    );
  }
}
