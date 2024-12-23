import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app/bloc_observer.dart';
import 'core/app/env.variable.dart';
import 'core/di/injection_container.dart';
import 'core/service/shared_pref/shared_pref.dart';
import 'my_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyAO7PgwmtWOPWM_4F7kIWHli6kt-ijQIZQ',
            appId: '1:880763185763:android:bac7216c5086d9b570e656',
            messagingSenderId: '880763185763',
            projectId: 'my-store-18935',
          ),
        )
      : await Firebase.initializeApp();
      await SharedPref().instantiatePreferences(); 
      await setupInjector();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const MyStoreApp());
  });
}
//? dart run build_runner build --delete-conflicting-outputs