import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';

class LoginController extends GetxController {
  RxBool isObscure = true.obs;
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    // Future.delayed(Duration(seconds: 2), () {
    //   Get.toNamed(Routes.HOME);
    // });
  }

  onPressedLogin(BuildContext context) {
    if (idController.text.isEmpty && passwordController.text.isEmpty) {
      showSnackBar(context, "ID and Password is required", Colors.red);
    } else if (idController.text.isEmpty) {
      showSnackBar(context, "ID is required", Colors.red);
    } else if (passwordController.text.isEmpty) {
      showSnackBar(context, "Password is required", Colors.red);
    } else {}
  }

  showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.black,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
