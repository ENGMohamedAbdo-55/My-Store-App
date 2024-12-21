import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/admin_appbar.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/styles/colors/colors_dark.dart';
import '../bloc/categories-number/categories_number_bloc.dart';
import '../bloc/products_number/products_number_bloc.dart';
import '../bloc/usres-number/users_number_bloc.dart';
import '../refactors/dashboard_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductsNumberBloc>()
            ..add(
              const ProductsNumberEvent.getProductsNumber(),
            ),
        ),
        BlocProvider(
          create: (context) => sl<CategoriesNumberBloc>()
            ..add(
              const CategoriesNumberEvent.getCategoriesNumber(),
            ),
        ),
        BlocProvider(
          create: (context) => sl<UsersNumberBloc>()
            ..add(
              const UsersNumberEvent.getUsersNumber(),
            ),
        ),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          isMain: true,
          title: 'Dashboard',
          backgroundColor: ColorsDark.mainColor,
        ),
        body: DashboardBody(),
      ),
    );
  }
}
