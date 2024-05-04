import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/records/records_controller.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';
import 'package:http/http.dart' as http;
import 'package:my_wellness_mobile/utils/constans.dart';
import 'package:my_wellness_mobile/widgets/custom_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

CustomLoader customLoader = CustomLoader();

class LoginController extends GetxController {
  RxBool isObscure = true.obs;
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onPressedLogin(BuildContext context) async {
    navigateToHome(context);
    // if (idController.text.isEmpty && passwordController.text.isEmpty) {
    //   showSnackBar(context, "ID and Password is required", Colors.red);
    // } else if (idController.text.isEmpty) {
    //   showSnackBar(context, "ID is required", Colors.red);
    // } else if (passwordController.text.isEmpty) {
    //   showSnackBar(context, "Password is required", Colors.red);
    // } else {
    //   await login(context);
    // }
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

  Future<void> login(BuildContext context) async {
    customLoader.show(context);
    const url = LOGIN_URL;
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(
          {'username': idController.text, 'password': passwordController.text}),
      headers: {'Content-Type': 'application/json'},
    );
    customLoader.hide();
    if (response.statusCode == 200) {
      String token = response.body;
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', token);
      sharedPreferences.setString('id', idController.text);
      // showSnackBar(context, "Login Successfull!", Colors.green);
      Future.delayed(const Duration(seconds: 2), () => navigateToHome(context));
    } else {
      showSnackBar(context, "Invalid ID or Password", Colors.red);
    }
  }

  navigateToHome(BuildContext context) {
    Navigator.pop(context);
    Get.put(RecordsController());
    Get.toNamed(Routes.HOME);
  }
}
