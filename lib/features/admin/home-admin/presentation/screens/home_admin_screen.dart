import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../../core/common/widgets/admin_appbar.dart';
import '../../../../../core/styles/colors/colors_dark.dart';
import '../../../../../core/styles/images/app_images.dart';
import '../../../../../core/utils/admin_drawer_list.dart';
import '../../../dashboard/presentation/screens/dashboard_screen.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  Widget page = const DashboardScreen();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return  MenuAdminScreen(onPageChanged:(a){
            setState(() {
              page = a;
            });
            ZoomDrawer.of(context)!.close();
          });
          
        },
      ),
      mainScreen: page,
      borderRadius: 24,
      showShadow: true,
      drawerShadowsBackgroundColor: ColorsDark.black1.withOpacity(0.6),
      menuBackgroundColor: ColorsDark.blueDark,
    );
  }
}

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({required this.onPageChanged, super.key});
  final void Function(Widget) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.blueDark,
      appBar: const AdminAppBar(
        isMain: false,
        title: 'My Store',
        backgroundColor: ColorsDark.blueDark,
      ),
      body: Column(
        children: [
          Column(
            children: adminDrawerList(context)
                .map(
                  (e) => ListTile(
                  onTap: () {
                    onPageChanged(e.page);
                    
                  },
                  title: e.title,
                  leading: e.icon,
                  ),
                )
                .toList(),
          ),
          Expanded(child: Image.asset(AppImages.drawerImage))
        ],
      ),
    );
  }
}
