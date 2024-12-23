import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/admin_appbar.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/styles/colors/colors_dark.dart';
import '../bloc/bloc/get_all_admin_categories_bloc.dart';
import '../refactor/add_categories_screen_body.dart';

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
