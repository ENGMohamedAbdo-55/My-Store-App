import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/toast/show_toast.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/features/admin/add-categories/presentation/bloc/delete-category/delete_category_bloc.dart';
import 'package:my_store/features/admin/add-categories/presentation/bloc/get-all-categories/get_all_admin_categories_bloc.dart';

class DeleteCategoriesWidget extends StatelessWidget {
  const DeleteCategoriesWidget({
    required this.categoryId,
    super.key,
  });
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCategoryBloc, DeleteCategoryState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<GetAllAdminCategoriesBloc>().add(
                GetAllAdminCategoriesEvent.fetchAdminCategories(
                    isNotLoading: false));
            ShowToast.showToastSuccessTop(
              message: 'Your Category Has Been Deleted Successfully',
            );
          },
          error: (error) {
            ShowToast.showToastErrorTop(
              message: context.translate(error),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (id) {
            if (id == categoryId) {
              return SizedBox(
                height: 15.h,
                width: 15.w,
                child: CircularProgressIndicator(
                  color: ColorsDark.white,
                ),
              );
            } else {
              return const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              );
            }
          },
          orElse: () {
            return InkWell(
              onTap: () {
                context.read<DeleteCategoryBloc>().add(
                      DeleteCategoryEvent.deletedCategory(
                        categoryId: categoryId,
                      ),
                    );
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            );
          },
        );
      },
    );
  }
}
