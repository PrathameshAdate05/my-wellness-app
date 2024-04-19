import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/login/login_controller.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // Future.delayed(Duration(seconds: 3), () {
    //   Get.put(LoginController());
    //   Get.toNamed(Routes.LOGIN);
    // });
    print("SPLASH CONTROL");
    super.onInit();
  }
}
