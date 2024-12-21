
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/styles/images/app_images.dart';
import '../bloc/categories-number/categories_number_bloc.dart';
import '../bloc/products_number/products_number_bloc.dart';
import '../bloc/usres-number/users_number_bloc.dart';
import 'dashboard_container.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 30.h,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          context
              .read<ProductsNumberBloc>()
              .add(const ProductsNumberEvent.getProductsNumber());
          context
              .read<CategoriesNumberBloc>()
              .add(const CategoriesNumberEvent.getCategoriesNumber());
          context
              .read<UsersNumberBloc>()
              .add(const UsersNumberEvent.getUsersNumber());
        },
        child: ListView(
          children: [
            BlocBuilder<ProductsNumberBloc, ProductsNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      title: 'products',
                      number: '',
                      image: AppImages.productsDrawer,
                      isLoading: true,
                    );
                  },
                  success: (productNumber) {
                    return DashboardContainer(
                      title: 'products',
                      number: productNumber,
                      image: AppImages.productsDrawer,
                      isLoading: false,
                    );
                  },
                  error: (error) {
                    return TextApp(
                      text: error,
                      theme: context.textStyle.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<CategoriesNumberBloc, CategoriesNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      title: 'Categories',
                      number: '',
                      image: AppImages.categoriesDrawer,
                      isLoading: true,
                    );
                  },
                  success: (categoryNumber) {
                    return DashboardContainer(
                      title: 'Categories',
                      number: categoryNumber,
                      image: AppImages.categoriesDrawer,
                      isLoading: false,
                    );
                  },
                  error: (error) {
                    return TextApp(
                      text: error,
                      theme: context.textStyle.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<UsersNumberBloc, UsersNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      title: 'Users',
                      number: '',
                      image: AppImages.usersDrawer,
                      isLoading: true,
                    );
                  },
                  success: (userNumber) {
                    return DashboardContainer(
                      title: 'Users',
                      number: userNumber,
                      image: AppImages.usersDrawer,
                      isLoading: false,
                    );
                  },
                  error: (error) {
                    return TextApp(
                      text: error,
                      theme: context.textStyle.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
