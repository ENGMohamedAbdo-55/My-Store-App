import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/admin_appbar.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/features/admin/add-categories/presentation/refactor/add_categories_screen_body.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AdminAppBar(
          isMain: true,
          title: 'Categories',
          backgroundColor: ColorsDark.mainColor),
      body: AddCategoriesScreenBody(),
    );
  }
}
