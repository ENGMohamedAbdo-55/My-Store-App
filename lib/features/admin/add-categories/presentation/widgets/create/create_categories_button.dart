import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/app/upload-image/cubit/upload_image_cubit.dart';
import '../../../../../../core/di/injection_container.dart';
import '../../bloc/create-category/create_category_bloc.dart';
import '../../bloc/get-all-categories/get_all_admin_categories_bloc.dart';
import '../../../../../../core/common/bottom-sheet/custom_bottom_sheet.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/styles/colors/colors_dark.dart';
import '../../../../../../core/styles/fonts/font_family_helper.dart';
import '../../../../../../core/styles/fonts/font_weight_helper.dart';
import 'create_category_bottom_sheet.dart';

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
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<CreateCategoryBloc>(),
            ),
            BlocProvider(
              create: (context) => sl<UploadImageCubit>(),
            ),
          ],
          child: CustomButton(
            onPressed: () {
              CustomBottomSheet.showCustomBottomSheet(
                context: context,
                widget: MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => sl<CreateCategoryBloc>(),),
                    BlocProvider(create: (context) => sl<UploadImageCubit>(),),
                  
                  ],
                  child: const CreateCategoryBottomSheet(),
                
                  ),
                  whenComplete: () {
                    context.read<GetAllAdminCategoriesBloc>().add(
                      GetAllAdminCategoriesEvent.fetchAdminCategories(
                        isNotLoading: false,
                      ),
                    );
                  },
              );
            
            },
            lastRadius: 10,
            threeRadius: 10,
            backgroundColor: ColorsDark.blueDark,
            text: 'Add',
            width: 90.w,
            height: 35.h,
          ),
        ),
      ],
    );
  }
}
