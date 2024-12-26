import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app/upload-image/cubit/upload_image_cubit.dart';
import '../../../../../core/di/injection_container.dart';
import '../bloc/create-category/create_category_bloc.dart';
import '../bloc/get-all-categories/get_all_admin_categories_bloc.dart';
import 'delete/delete_category_widget.dart';
import '../../../../../core/common/bottom-sheet/custom_bottom_sheet.dart';
import '../../../../../core/common/widgets/custom_container_linear_admin.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/styles/fonts/font_family_helper.dart';
import 'update/update_categories_bottom_sheet_.dart';

class AddCategoriesItem extends StatelessWidget {
  const AddCategoriesItem({
    required this.name,
    required this.image,
    required this.categoryId,
    super.key,
  });
  final String name;
  final String image;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: name,
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    DeleteCategoriesWidget(
                      categoryId: categoryId,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      onTap: () {
                        _updateCategoryBottomSheet(context);
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            Flexible(
              child: CachedNetworkImage(
                imageUrl: image,
                height: 90.h,
                width: 120.w,
                //fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateCategoryBottomSheet(BuildContext context) {
     CustomBottomSheet.showCustomBottomSheet(
      context: context,
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<CreateCategoryBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<UploadImageCubit>(),
          ),
        ],
        child: UpdateCategoriesBottomSheet(
          categoryId: categoryId,
          categoryName: name,
          imageUrl: image,
        ),
      ),
      whenComplete: () {
        context.read<GetAllAdminCategoriesBloc>().add(
              GetAllAdminCategoriesEvent.fetchAdminCategories(
          isNotLoading: false
        ),);
      },
    );
  }
}
