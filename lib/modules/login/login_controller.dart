import 'package:get/get.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(Routes.HOME);
    });
  }
}
