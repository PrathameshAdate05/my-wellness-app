import 'package:get/get.dart';
import 'package:my_wellness_mobile/data/models/record_model.dart';

class RecordDetailsController extends GetxController {
  Map arguments = Get.arguments;
  late RecordModel temp;
  late Rx<RecordModel> record;

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  getArguments() {
    temp = arguments["record"];
    record = Rx<RecordModel>(temp);
    print(record.value);
  }
}
