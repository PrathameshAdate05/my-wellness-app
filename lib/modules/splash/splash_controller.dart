import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  BuildContext? context;

  @override
  void onInit() async {
    Future.delayed(const Duration(seconds: 3), () {
      checkLogin();
    });
    super.onInit();
  }

  checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String token = sharedPreferences.getString("token") ?? "";
    if (token.isNotEmpty) {
      Navigator.pop(context!);
      Get.toNamed(Routes.RECORDS);
    } else {
      Navigator.pop(context!);
      Get.toNamed(Routes.LOGIN);
    }
  }
}
