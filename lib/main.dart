import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'my_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyAO7PgwmtWOPWM_4F7kIWHli6kt-ijQIZQ",
            appId: "1:880763185763:android:bac7216c5086d9b570e656",
            messagingSenderId: "880763185763",
            projectId: "my-store-18935",
          ),
      )
      : await Firebase.initializeApp();
  await Firebase.initializeApp();
  runApp(const MyStoreApp());
}
