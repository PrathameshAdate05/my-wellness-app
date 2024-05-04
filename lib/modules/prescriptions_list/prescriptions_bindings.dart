import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/prescriptions_list/prescriptions_controller.dart';

class PrescriptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrescriptionsController());
  }
}
