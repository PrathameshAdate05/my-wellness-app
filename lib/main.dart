import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/splash/splash_controller.dart';
import 'package:my_wellness_mobile/routes/app_pages.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

void main() {
  if (Platform.isAndroid) {
    SharedPreferencesAndroid.registerWith();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SPLASH,
        getPages: AppPages.routes,
        theme: ThemeData.light(),
        darkTheme: ThemeData.light(),
        builder: (context, child) {
          child = EasyLoading.init()(context, child);
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        initialBinding: BindingsBuilder(() {
          Get.put(SplashController());
        }));
  }
}
