import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app/app/modules/auth/bindings/initial_bindings.dart';

import 'app/modules/auth/views/login_view.dart';
import 'app/routes/app_pages.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBindins(),
      theme: AppTheme.theme,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
