import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/prescritption_detail/prescription_detail_controller.dart';

class PrescriptionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrescriptionDetailController());
  }
}
