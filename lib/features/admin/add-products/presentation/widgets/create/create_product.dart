import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/upload-image/cubit/upload_image_cubit.dart';
import 'package:my_store/core/di/injection_container.dart';
import 'package:my_store/features/admin/add-products/presentation/bloc/create-product/create_product_bloc.dart';
import 'package:my_store/features/admin/add-products/presentation/bloc/products-bloc/get_all_admin_products_bloc.dart';
import '../../../../../../core/common/bottom-sheet/custom_bottom_sheet.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/styles/colors/colors_dark.dart';
import '../../../../../../core/styles/fonts/font_family_helper.dart';
import '../../../../../../core/styles/fonts/font_weight_helper.dart';
import '../../../../add-categories/presentation/bloc/get-all-categories/get_all_admin_categories_bloc.dart';
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
              widget: MultiBlocProvider(providers: [
                BlocProvider(
                  create: (context) => sl<CreateProductBloc>(),
                ),
                BlocProvider(create: (context) => sl<UploadImageCubit>()),
                BlocProvider(
                  create: (context) => sl<GetAllAdminCategoriesBloc>()
                    ..add(const GetAllAdminCategoriesEvent.fetchAdminCategories(
                        isNotLoading: false)),
                ),
              ], child: CreateProductBottomSheet()),
              whenComplete: () {
                context.read<GetAllAdminProductsBloc>()
                  ..add(
                    GetAllAdminProductsEvent.getAllProducts(
                        isNotLoading: false),
                  );
              });
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
