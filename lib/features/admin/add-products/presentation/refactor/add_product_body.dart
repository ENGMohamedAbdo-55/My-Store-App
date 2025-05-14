import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/loading/empty_screen.dart';
import 'package:my_store/core/common/loading/loading_shimmer.dart';
import 'package:my_store/features/admin/add-products/presentation/bloc/products-bloc/get_all_admin_products_bloc.dart';
import '../widgets/create/create_product.dart';
import '../widgets/product_admin_item.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 30.h,
      ),
      child: Column(
        children: [
          CreateProduct(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetAllAdminProductsBloc>().add(
                      GetAllAdminProductsEvent.getAllProducts(
                          isNotLoading: true),
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
                    child: BlocBuilder<GetAllAdminProductsBloc,
                        GetAllAdminProductsState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 10.h,
                              ),
                              itemBuilder: (context, index) {
                                return LoadingShimmer(
                                  height: 220.h,
                                  width: 165.w,
                                );
                              },
                            );
                          },
                          success: (list) {
                            return GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: list.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 10.h,
                              ),
                              itemBuilder: (context, index) {
                                return ProductAdminItem(
                                  categoryName:
                                      list[index].category!.name ?? 'not found',
                                  imageUrl: list[index].images!.first,
                                  title: list[index].title ?? 'not found',
                                  price: list[index].price.toString(),
                                );
                              },
                            );
                          },
                          error: Text.new,
                          empty: EmptyScreen.new,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
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
