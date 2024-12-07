import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/app_cubit/app_cubit.dart';
import 'package:my_store/core/app/connectivity_controller.dart';
import 'package:my_store/core/common/screen/no_network_screen.dart';
import 'package:my_store/core/di/injection_container.dart';
import 'package:my_store/core/language/local_localization_setup.dart';
import 'package:my_store/core/routes/app_routs.dart';
import 'package:my_store/core/service/shared_pref/pref_keys.dart';
import 'package:my_store/core/service/shared_pref/shared_pref.dart';

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
          return BlocProvider(
            create: (context) => sl<AppCubit>()
              ..changeAppThemeMode(
                sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
              )
              ..getSavedLanguage(),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) {
                  return previous != current;
                },
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    theme: cubit.isDark ? themeLight() : themeDark(),
                    locale: Locale(cubit.currentLanguage),
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    builder: (context, widget) {
                      return GestureDetector(
                        onTap: () =>
                            FocusManager.instance.primaryFocus?.unfocus(),
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
                  );
                },
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
