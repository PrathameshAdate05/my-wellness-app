import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/record_details/record_details_controller.dart';

class RecordDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecordDetailsController());
  }
}
