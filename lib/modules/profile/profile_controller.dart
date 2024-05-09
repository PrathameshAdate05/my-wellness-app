import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_wellness_mobile/data/models/patient_model.dart';
import 'package:my_wellness_mobile/routes/app_routes.dart';
import 'package:my_wellness_mobile/utils/constans.dart';
import 'package:my_wellness_mobile/widgets/custom_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  RxBool isQR = true.obs;
  CustomLoader customLoader = CustomLoader();
  RxList<Patient> patient = RxList();
  RxString userId = ''.obs;
  RxString token = ''.obs;

  @override
  void onInit() async {
    patient.add(Patient(
        patientId: "",
        firstName: "",
        middleName: "",
        lastName: "",
        email: "",
        contact: "",
        age: 0,
        gender: "",
        isAlive: false,
        address: "",
        city: "",
        state: "",
        pincode: "",
        country: "",
        createdAt: "2024-05-04T13:28:26+00:00",
        updatedAt: "",
        dob: "2024-05-04"));
    await getUserIdAndToken();
    await getPatientProfile();
    super.onInit();
  }

  getUserIdAndToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId.value = sharedPreferences.getString('id') ?? '';
    token.value = sharedPreferences.getString('token') ?? '';
  }

  Future<void> getPatientProfile() async {
    customLoader.show(Get.context!);
    String url = "$PROFILE_URL${userId.value}";
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
      dynamic res = jsonDecode(response.body);
      dynamic resPatient = res["user"];
      DateTime createdAtDateTime = DateTime.parse(resPatient["createdAt"]);
      String formattedCreatedDate =
          DateFormat('yyyy-MM-dd').format(createdAtDateTime);

      DateTime dob = DateTime.parse(resPatient["dob"]);
      String formattedDOB = DateFormat('yyyy-MM-dd').format(dob);

      Patient tempPatient = Patient(
        patientId: resPatient["patientId"],
        firstName: resPatient["firstName"],
        middleName: resPatient["middleName"],
        lastName: resPatient["lastName"],
        email: resPatient["email"],
        contact: resPatient["contact"],
        age: resPatient["age"],
        gender: resPatient["gender"],
        isAlive: resPatient["isAlive"],
        address: resPatient["address"],
        city: resPatient["city"],
        state: resPatient["state"],
        pincode: resPatient["pincode"],
        country: resPatient["country"],
        createdAt: formattedCreatedDate,
        updatedAt: resPatient["updatedAt"],
        dob: formattedDOB,
      );

      patient.clear();
      patient.add(tempPatient);
      // print("tempPatient ${patient.value.firstName}");
      print("RES : $resPatient");
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

  onPressedLogout(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Navigator.pop(context);
    Get.toNamed(Routes.LOGIN);
  }
}
