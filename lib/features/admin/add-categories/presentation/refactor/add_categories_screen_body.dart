import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/features/admin/add-categories/presentation/widgets/create/add_categories_item.dart';
import 'package:my_store/features/admin/add-categories/presentation/widgets/create/create_categories_button.dart';

class AddCategoriesScreenBody extends StatelessWidget {
  const AddCategoriesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 30.h,
      ),
      child: Column(
        children: [
          //! create add categories button
          const CreateCategoriesButton(),
          const SizedBox(
            height: 20,
          ),
          //! create add categories item
          Expanded(
            child: RefreshIndicator(
              color: ColorsDark.blueDark,
              onRefresh: () async {},
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const AddCategoriesItem(
                          name: 'name',
                          image: 'image',
                          categoryId: 'categoryId',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 15.h,
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
