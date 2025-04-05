import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/upload-image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/common/toast/show_toast.dart';
import 'package:my_store/core/language/lang_keys.dart';
import 'package:my_store/features/admin/add-categories/presentation/bloc/get-all-categories/get_all_admin_categories_bloc.dart';
import 'package:my_store/features/admin/add-products/data/models/create_product_request_body.dart';
import 'package:my_store/features/admin/add-products/presentation/bloc/create-product/create_product_bloc.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_drop_down.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/styles/colors/colors_dark.dart';
import '../../../../../../core/styles/fonts/font_family_helper.dart';
import '../../../../../../core/styles/fonts/font_weight_helper.dart';
import 'create_product_images.dart';

class CreateProductBottomSheet extends StatefulWidget {
  const CreateProductBottomSheet({super.key});

  @override
  State<CreateProductBottomSheet> createState() =>
      _CreateProductBottomSheetState();
}

class _CreateProductBottomSheetState extends State<CreateProductBottomSheet> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? categoryName;
  double? categoryId;
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
              Center(
                child: TextApp(
                  text: 'Create Product',
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
                  text: 'Add a photos',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  )),
              SizedBox(
                height: 15.h,
              ),
              createProductImages(),
              SizedBox(
                height: 15.h,
              ),
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
                controller: descriptionController,
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
              BlocBuilder<GetAllAdminCategoriesBloc,
                  GetAllAdminCategoriesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (category) {
                      return CustomCreateDropDown(
                        hintText: 'Choose category',
                        items: category.categoryDropdownList,
                        onChanged: (value) {
                          setState(() {
                            categoryName = value;
                            final categoryIdString = category.categoriesList
                                .firstWhere((element) => element.name == value)
                                .id!;
                            categoryId = double.parse(categoryIdString);
                          });
                        },
                        value: categoryName,
                      );
                    },
                    orElse: () {
                      return CustomCreateDropDown(
                        hintText: 'Choose category',
                        items: const [''],
                        onChanged: (value) {
                          setState(() {
                            categoryName = value;
                          });
                        },
                        value: '',
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocConsumer<CreateProductBloc, CreateProductState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      context.pop();
                      ShowToast.showToastSuccessTop(
                        message: '${titleController.text} Created Successfully',
                      );
                    },
                    error: (errorMessage){
                      ShowToast.showToastErrorTop(
                        message: errorMessage,
                      );
                    }
                  );
                  
                },
                builder: (context, state) {
                  return state.maybeWhen(loading: () {
                    return Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: ColorsDark.blueDark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child:
                            CircularProgressIndicator(color: ColorsDark.white),
                      ),
                    );
                  }, orElse: () {
                    return CustomButton(
                      text: 'Add Product',
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      textColor: ColorsDark.blueDark,
                      threeRadius: 20,
                      lastRadius: 20,
                      backgroundColor: ColorsDark.white,
                      onPressed: () {
                        _validCreateProductButton(context);
                      },
                    );
                  });
                },
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validCreateProductButton(BuildContext context) {
    final indexEmptyImage = context
        .read<UploadImageCubit>()
        .imageList
        .indexWhere((e) => e.isNotEmpty);
    if (formKey.currentState!.validate() ||
        indexEmptyImage == -1 ||
        categoryName == null) {
      if (indexEmptyImage == -1) {
        ShowToast.showToastErrorTop(
          message: context.translate(LangKeys.validPickImage),
        );
      } else if (categoryName == null) {
        ShowToast.showToastErrorTop(
          message: 'Please choose category',
        );
      }
      else {
//! Create Category
      context.read<CreateProductBloc>().add(CreateProductEvent.createProduct(
            body: CreateProductRequestBody(
              title: titleController.text.trim(),
              imageList: context.read<UploadImageCubit>().imageList,
              categoryId: categoryId ?? 0,
              description: descriptionController.text.trim(),
              price: double.parse(
                priceController.text.trim(),
              ),
            ),
          ));
    }
    } 
  }
}
