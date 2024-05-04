import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/data/models/medicine_model.dart';
import 'package:my_wellness_mobile/data/models/prescription_model.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';
import 'package:my_wellness_mobile/utils/constans.dart';
import 'package:my_wellness_mobile/widgets/custom_loader.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PrescriptionsController extends GetxController {
  CustomLoader customLoader = CustomLoader();
  RxList<Prescription> prescriptionList = RxList();
  RxString userId = ''.obs;
  RxString token = ''.obs;

  @override
  void onInit() async {
    await getUserIdAndToken();
    await getUserPrescriptions();
    super.onInit();
  }

  getUserIdAndToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId.value = sharedPreferences.getString('id') ?? '';
    token.value = sharedPreferences.getString('token') ?? '';
  }

  Future<void> getUserPrescriptions() async {
    customLoader.show(Get.context!);
    String url = "$RECORDS_URL${userId.value}";
    print("URL $url");
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${token.value}"
      },
    );
    customLoader.hide();
    if (response.statusCode == 200) {
      List<dynamic> recordsJson = jsonDecode(response.body);
      prescriptionList.clear();

      for (var recordJson in recordsJson) {
        Prescription prescription = Prescription(
          pid: recordJson['prescription']['pid'],
          patientId: recordJson['prescription']['patientId'],
          doctorId: recordJson['prescription']['doctorId'],
          hospitalId: recordJson['prescription']['hospitalId'],
          createdAt: recordJson['prescription']['createdAt'],
          medicines: (recordJson['prescription']['medicines'] as List<dynamic>)
              .map((medicineJson) {
            return Medicine(
              name: medicineJson['name'],
              description: medicineJson['description'],
            );
          }).toList(),
        );
        prescriptionList.add(prescription);
      }

      List<Prescription> reversedRecords =
          List<Prescription>.from(prescriptionList.reversed);
      prescriptionList.assignAll(reversedRecords);
      print("PRESCRIPTIONS: ${prescriptionList.length}");
    } else if (response.statusCode == 401) {
      showSnackBar(Get.context!, "Session Expired", Colors.yellow);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.clear();
      Navigator.pop(Get.context!);
      Get.toNamed(Routes.LOGIN);
    } else {
      print(response.body);
      showSnackBar(Get.context!, "Something went wrong try again!", Colors.red);
    }
  }

  showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.black,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
