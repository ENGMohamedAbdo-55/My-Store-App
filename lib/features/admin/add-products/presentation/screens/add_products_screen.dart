import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/admin_appbar.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/features/admin/add-products/presentation/refactor/add_product_body.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AdminAppBar(isMain: true, title: 'Products', backgroundColor: ColorsDark.mainColor),
      
      body: AddProductBody(),
      
    );
  }
}
