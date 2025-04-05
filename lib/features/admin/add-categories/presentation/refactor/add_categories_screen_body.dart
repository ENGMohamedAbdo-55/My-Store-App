import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/loading/empty_screen.dart';
import '../../../../../core/common/loading/loading_shimmer.dart';
import '../../../../../core/styles/colors/colors_dark.dart';
import '../bloc/get-all-categories/get_all_admin_categories_bloc.dart';
import '../widgets/add_categories_item.dart';
import '../widgets/create/create_categories_button.dart';

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
              onRefresh: () async {
                context.read<GetAllAdminCategoriesBloc>().add(
                      const GetAllAdminCategoriesEvent.fetchAdminCategories(
                        isNotLoading: true,
                      ),
                    );
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllAdminCategoriesBloc,
                        GetAllAdminCategoriesState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return LoadingShimmer(
                                  height: 130.h,
                                  borderRadius: 15,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15.h,
                                );
                              },
                              itemCount: 4,
                            );
                          },
                          success: (list) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return AddCategoriesItem(
                                  name: list.categoriesList[index].name ?? '',
                                  image: list.categoriesList[index].image ?? '',
                                  categoryId:
                                      list.categoriesList[index].id ?? '',
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15.h,
                                );
                              },
                              itemCount: list.categoriesList.length,
                            );
                          },
                          empty: () {
                            return const EmptyScreen(
                              title: 'No Categories',
                            );
                          },
                          error: (error) {
                            return EmptyScreen(
                              title: error,
                            );
                          },
                        );
                      },
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
