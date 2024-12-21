import 'package:flutter/material.dart';
import 'package:my_store/core/common/widgets/admin_appbar.dart';
import 'package:my_store/core/styles/colors/colors_dark.dart';
import 'package:my_store/features/admin/dashboard/presentation/refactors/dashboard_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: AdminAppBar(
        isMain: true,
        title: 'Dashboard',
        backgroundColor: ColorsDark.mainColor,
      ),
      body: DashboardBody(),
    );
  }
}