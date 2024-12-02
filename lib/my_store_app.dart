import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/connectivity_controller.dart';
import 'package:my_store/core/common/screen/no_network_screen.dart';
import 'package:my_store/core/styles/images/fonts/font_family_helper.dart';

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
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              builder: (context, widget) {
                return Scaffold(
                  body: Builder(
                    builder: (context) {
                      ConnectivityController.instance.init();
                      return widget!;
                    },
                  ),
                );
              },
              home: Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  title: const Text('MyStore'),
                ),
                body: const Center(
                  child: Column(
                    children: [
                      Text(
                        'English',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'عربي',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'English',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: FontFamilyHelper.poppinsEnglish,
                        ),
                      ),
                      Text(
                        'عربي',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: FontFamilyHelper.cairoArabic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
