import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
