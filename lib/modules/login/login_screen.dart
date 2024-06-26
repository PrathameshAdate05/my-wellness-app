import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Image.asset(
                "assets/images/login_image.jpg",
              ),
            ),
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Obx(
                () => Column(
                  children: [
                    TextField(
                      style: const TextStyle(fontFamily: "Poppins"),
                      controller: controller.idController,
                      decoration: const InputDecoration(
                          hintText: "Patient ID",
                          border:
                              OutlineInputBorder(), // To remove the default border of the TextField
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          prefixIcon:
                              Icon(Icons.person) // Adjust padding if needed
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      style: const TextStyle(fontFamily: "Poppins"),
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            !controller.isObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            controller.isObscure.value =
                                !controller.isObscure.value;
                          },
                        ),
                      ), // Adjust padding if needed
                      obscureText: controller.isObscure.value,
                    ),
                    const SizedBox(height: 100),
                    SizedBox(
                      width: Get.width,
                      height: 50, // Set your desired width here
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(14, 206, 112, 1),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => controller.onPressedLogin(context),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
