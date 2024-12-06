import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/connectivity_controller.dart';
import 'package:my_store/core/common/screen/no_network_screen.dart';
import 'package:my_store/core/language/local_localization_setup.dart';
import 'package:my_store/core/routes/app_routs.dart';

import 'package:my_store/core/styles/theme/app_theme.dart';


class MyStoreApp extends StatelessWidget {
  const MyStoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: themeDark(),
              locale: const Locale('en'),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
                  localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
              builder: (context, widget) {
                return GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Scaffold(
                    body: Builder(
                      builder: (context) {
                        ConnectivityController.instance.init();
                        return widget!;
                      },
                    ),
                  ),
                );
              },
              onGenerateRoute: AppRouts.onGenrateRoute,
              initialRoute: AppRouts.login,
            ),
          );
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'No Network',
            home: NoNetworkScreen(),
          );
        }
      },
    );
  }
}
