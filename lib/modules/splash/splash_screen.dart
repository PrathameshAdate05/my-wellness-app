import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(34, 194, 182, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "MyWellness",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const Text(
                "Syncing Your Health Information Securely",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic),
              )
            ],
          ),
        ));
  }
}
