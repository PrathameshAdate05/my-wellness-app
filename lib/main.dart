import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/routes/app_pages.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';

void main() {
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
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(Routes.LOGIN);
    });
    return Scaffold(
      body: Center(
        child: Text("SPLASH"),
      ),
    );
  }
}
