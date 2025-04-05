import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/injection_container.dart';
import 'package:my_store/features/admin/add-products/presentation/bloc/products-bloc/get_all_admin_products_bloc.dart';
import '../../../../../core/common/widgets/admin_appbar.dart';
import '../../../../../core/styles/colors/colors_dark.dart';
import '../refactor/add_product_body.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider
    (
      providers: [
        BlocProvider(create: (context) => sl<GetAllAdminProductsBloc>()..add(GetAllAdminProductsEvent.getAllProducts(isNotLoading: true)),),
      ],
      child: Scaffold(
        appBar:AdminAppBar(isMain: true, title: 'Products', backgroundColor: ColorsDark.mainColor),
        
        body: AddProductBody(),
        
      ),
    );
  }
}
