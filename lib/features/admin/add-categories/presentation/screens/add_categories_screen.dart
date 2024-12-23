import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common/widgets/admin_appbar.dart';
import 'package:my_store/core/di/injection_container.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/features/admin/add-categories/presentation/bloc/get-all-admin-categories/get_all_admin_categories_bloc.dart';
import 'package:my_store/features/admin/add-categories/presentation/refactor/add_categories_screen_body.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllAdminCategoriesBloc>()
            ..add(
              const GetAllAdminCategoriesEvent.fetchAdminCategories(),
            ),
        ),
      ],
      child: const Scaffold(
        appBar: AdminAppBar(
            isMain: true,
            title: 'Categories',
            backgroundColor: ColorsDark.mainColor),
        body: AddCategoriesScreenBody(),
      ),
    );
  }
}
