import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/records/records_controller.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';

class BottomNavController extends GetxController {
  RxBool profile = false.obs;
  RxBool records = false.obs;
  RxBool prescription = false.obs;
  late BuildContext context;

  onPressedProfile() {
    navigateToProfile();
  }

  onPressedRecords() {
    navigateToRecords();
  }

  onPressedPrescriptions() {
    navigateToPrescriptions();
  }

  navigateToRecords() {
    print("Navigating to records...");
    // Navigator.pop(context);
    // Get.put(RecordsController());
    Get.toNamed(Routes.RECORDS);
  }

  navigateToPrescriptions() {
    Navigator.pop(context);
    Get.toNamed(Routes.PRESCRIPTIONS);
  }

  navigateToProfile() {
    Navigator.pop(context);
    Get.toNamed(Routes.PROFILE);
  }
}
