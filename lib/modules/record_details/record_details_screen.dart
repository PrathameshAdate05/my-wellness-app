import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_wellness_mobile/modules/record_details/record_details_controller.dart';
import 'package:my_wellness_mobile/utils/colors.dart';
import 'package:my_wellness_mobile/widgets/dashed_horizontal_line_printer.dart';
import 'package:my_wellness_mobile/widgets/medicine_details_view.dart';

class RecordDetialsScreen extends StatelessWidget {
  final RecordDetailsController controller =
      Get.find<RecordDetailsController>();
  @override
  Widget build(BuildContext context) {
    DateTime createdAt = DateTime.parse(controller.record.value.createdAt);
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm a').format(createdAt);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Record Details",
            style: TextStyle(fontFamily: "Poppins"),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: CustomColor.darkGreen,
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/record_icon.png",
                    height: 50,
                  ),
                ),
                Center(
                  child: Text("Diagnosis Details",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20.0,
                          color: CustomColor.extraDarkGreen,
                          fontWeight: FontWeight.w600)),
                ),
                Text(
                  "Diagnosis :",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Poppins",
                      color: CustomColor.extraDarkGreen,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.diagnosis,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Description :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.description,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Created At :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      formattedDate,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomPaint(
                  painter: DashedLineHorizontalPainter(
                    dashWidth: 3,
                    dashSpace: 3,
                    color: Colors.black,
                  ),
                  size: Size(Get.width, 1),
                ),
                const SizedBox(
                  height: 3,
                ),
                CustomPaint(
                  painter: DashedLineHorizontalPainter(
                    dashWidth: 3,
                    dashSpace: 3,
                    color: Colors.black,
                  ),
                  size: Size(Get.width, 1),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/medicine_icon.png",
                    height: 50,
                  ),
                ),
                Center(
                  child: Text("Medicine Details",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20.0,
                          color: CustomColor.extraDarkGreen,
                          fontWeight: FontWeight.w600)),
                ),
                Column(
                  children: controller.record.value.prescription.medicines
                      .map((medicine) {
                    return MedicineDetailsView(medicine: medicine);
                  }).toList(), // Convert the map result into a list
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomPaint(
                  painter: DashedLineHorizontalPainter(
                    dashWidth: 3,
                    dashSpace: 3,
                    color: Colors.black,
                  ),
                  size: Size(Get.width, 1),
                ),
                const SizedBox(
                  height: 3,
                ),
                CustomPaint(
                  painter: DashedLineHorizontalPainter(
                    dashWidth: 3,
                    dashSpace: 3,
                    color: Colors.black,
                  ),
                  size: Size(Get.width, 1),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/hospital.png",
                    height: 50,
                  ),
                ),
                Center(
                  child: Text("Hospital Details",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20.0,
                          color: CustomColor.extraDarkGreen,
                          fontWeight: FontWeight.w600)),
                ),

                Text("Hospital ID :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.hospital.hospitalId,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Hospital Name :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.hospital.name,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Email :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
// Email
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.hospital.email,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Text("Address :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
// Address
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.hospital.address,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Text("City :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.hospital.city,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Text("State :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.hospital.state,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Pincode :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
// Pincode
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.hospital.pincode,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Country :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
// Country
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.hospital.country,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Contact :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
// Contact
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.hospital.contact,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Hospital Type :",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        color: CustomColor.extraDarkGreen,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
// Type
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.hospital.type,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                CustomPaint(
                  painter: DashedLineHorizontalPainter(
                    dashWidth: 3,
                    dashSpace: 3,
                    color: Colors.black,
                  ),
                  size: Size(Get.width, 1),
                ),
                const SizedBox(
                  height: 3,
                ),
                CustomPaint(
                  painter: DashedLineHorizontalPainter(
                    dashWidth: 3,
                    dashSpace: 3,
                    color: Colors.black,
                  ),
                  size: Size(Get.width, 1),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/doctor.png",
                    height: 50,
                  ),
                ),
                Center(
                  child: Text("Doctor Details",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20.0,
                          color: CustomColor.extraDarkGreen,
                          fontWeight: FontWeight.w600)),
                ),

                // Doctor ID
                Text(
                  "Doctor ID :",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14.0,
                    color: CustomColor.extraDarkGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.doctor.doctorId,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  "Doctor Name :",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14.0,
                    color: CustomColor.extraDarkGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${controller.record.value.doctor.firstName} ${controller.record.value.doctor.middleName} ${controller.record.value.doctor.lastName}",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  "Doctor Email :",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14.0,
                    color: CustomColor.extraDarkGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.doctor.email,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  "Doctor Contact :",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14.0,
                    color: CustomColor.extraDarkGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.doctor.contact,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  "Doctor Qualification :",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14.0,
                    color: CustomColor.extraDarkGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.record.value.doctor.qualification,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomPaint(
                  painter: DashedLineHorizontalPainter(
                    dashWidth: 3,
                    dashSpace: 3,
                    color: Colors.black,
                  ),
                  size: Size(Get.width, 1),
                ),
                const SizedBox(
                  height: 3,
                ),
                CustomPaint(
                  painter: DashedLineHorizontalPainter(
                    dashWidth: 3,
                    dashSpace: 3,
                    color: Colors.black,
                  ),
                  size: Size(Get.width, 1),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
