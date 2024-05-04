import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/records/records_controller.dart';

class RecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecordsController());
  }
}
