import 'package:flutter/material.dart';
import '../../../../../core/common/widgets/admin_appbar.dart';
import '../../../../../core/styles/colors/colors_dark.dart';
import '../refactor/add_product_body.dart';

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
