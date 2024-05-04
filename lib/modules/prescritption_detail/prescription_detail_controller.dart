import 'package:get/get.dart';
import 'package:my_wellness_mobile/data/models/prescription_model.dart';

class PrescriptionDetailController extends GetxController {
  Map arguments = Get.arguments;
  late Prescription temp;

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  getArguments() {
    temp = arguments["prescription"];
  }
}
