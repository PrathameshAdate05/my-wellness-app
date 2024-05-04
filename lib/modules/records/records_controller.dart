import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/data/models/doctor_model.dart';
import 'package:my_wellness_mobile/data/models/hospital_model.dart';
import 'package:my_wellness_mobile/data/models/medicine_model.dart';
import 'package:my_wellness_mobile/data/models/prescription_model.dart';
import 'package:my_wellness_mobile/data/models/record_model.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';
import 'package:my_wellness_mobile/utils/constans.dart';
import 'package:my_wellness_mobile/widgets/custom_loader.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RecordsController extends GetxController {
  CustomLoader customLoader = CustomLoader();
  RxList<RecordModel> recordsList = RxList();
  RxString userId = ''.obs;
  RxString token = ''.obs;

  @override
  void onInit() async {
    await getUserIdAndToken();
    await getUserRecords();
    super.onInit();
  }

  getUserIdAndToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId.value = sharedPreferences.getString('id') ?? '';
    token.value = sharedPreferences.getString('token') ?? '';
  }

  Future<void> getUserRecords() async {
    customLoader.show(Get.context!);
    String url = "$RECORDS_URL${userId.value}";
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

      print(response.body);
      // Clear the existing records list
      recordsList.clear();

      // Process each record and add it to the recordsList
      for (var recordJson in recordsJson) {
        RecordModel record = RecordModel(
          doctorId: recordJson['doctorId'],
          patientId: recordJson['patientId'],
          hospitalId: recordJson['hospitalId'],
          createdAt: recordJson['createdAt'],
          prescription: Prescription(
            pid: recordJson['prescription']['pid'],
            medicines:
                (recordJson['prescription']['medicines'] as List<dynamic>)
                    .map((medicineJson) {
              return Medicine(
                name: medicineJson['name'],
                description: medicineJson['description'],
              );
            }).toList(),
            patientId: recordJson['prescription']['patientId'],
            doctorId: recordJson['prescription']['doctorId'],
            hospitalId: recordJson['prescription']['hospitalId'],
            createdAt: recordJson['prescription']['createdAt'],
          ),
          diagnosis: recordJson['diagnosis'],
          description: recordJson['description'],
          admissionDate: DateTime.parse(recordJson['admissionDate']),
          dischargeDate: DateTime.parse(recordJson['dischargeDate']),
          doctor: Doctor(
            doctorId: recordJson['doctor']['doctorId'],
            firstName: recordJson['doctor']['firstName'],
            middleName: recordJson['doctor']['middleName'],
            lastName: recordJson['doctor']['lastName'],
            email: recordJson['doctor']['email'],
            contact: recordJson['doctor']['contact'],
            qualification: recordJson['doctor']['qualification'],
            age: recordJson['doctor']['age'],
            gender: recordJson['doctor']['gender'],
            address: recordJson['doctor']['address'],
            city: recordJson['doctor']['city'],
            state: recordJson['doctor']['state'],
            pincode: recordJson['doctor']['pincode'],
            country: recordJson['doctor']['country'],
            createdAt: recordJson['doctor']['createdAt'],
            updatedAt: recordJson['doctor']['updatedAt'],
          ),
          hospital: Hospital(
            hospitalId: recordJson['hospital']['hospitalId'],
            name: recordJson['hospital']['name'],
            email: recordJson['hospital']['email'],
            address: recordJson['hospital']['address'],
            city: recordJson['hospital']['city'],
            state: recordJson['hospital']['state'],
            pincode: recordJson['hospital']['pincode'],
            country: recordJson['hospital']['country'],
            contact: recordJson['hospital']['contact'],
            type: recordJson['hospital']['type'],
            createdAt: recordJson['hospital']['createdAt'],
            updatedAt: recordJson['hospital']['updatedAt'],
          ),
        );
        recordsList.add(record);
      }
    } else {
      print(response.body);
      showSnackBar(Get.context!, "Something went wrong try again!", Colors.red);
    }
  }

  onPressedViewRecord(BuildContext context, int index) {
    Get.toNamed(Routes.RECORD_DETAILS,
        arguments: {"record": recordsList[index]});
  }

  onPressedViewPrescription(BuildContext context, int index) {}

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
