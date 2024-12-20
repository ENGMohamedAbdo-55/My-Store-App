import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/styles/images/app_images.dart';
import 'package:my_store/features/admin/dashboard/presentation/refactors/dashboard_container.dart';

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
        onRefresh: () async {},
        child: ListView(
          children: [
            const DashboardContainer(
              title: 'products',
              number: '250',
              image: AppImages.productsDrawer,
              isLoading: false,
            ),
            SizedBox(
              height: 20.h,
            ),
            const DashboardContainer(
              title: 'Categories',
              number: '5',
              image: AppImages.categoriesDrawer,
              isLoading: false,
            ),
            SizedBox(
              height: 20.h,
            ),
            const DashboardContainer(
              title: 'Users',
              number: '100',
              image: AppImages.usersDrawer,
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
