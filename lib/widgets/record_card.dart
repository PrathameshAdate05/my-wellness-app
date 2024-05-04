import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/data/models/record_model.dart';
import 'package:my_wellness_mobile/utils/colors.dart';
import 'package:intl/intl.dart';

class RecordCardView extends StatelessWidget {
  RecordCardView({required this.record});

  final RecordModel record;
  @override
  Widget build(BuildContext context) {
    DateTime createdAtDateTime = DateTime.parse(record.createdAt);
    String formattedDate =
        DateFormat('yyyy-MM-dd hh:mm a').format(createdAtDateTime);
    return Card(
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.all(10),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Hospital :",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(record.hospital.name,
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Doctor :",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text("${record.doctor.firstName}${record.doctor.lastName}",
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Diagnosis :",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(record.diagnosis,
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Record Date :",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(formattedDate,
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    margin: const EdgeInsets.only(left: 5, right: 10),
                    decoration: BoxDecoration(
                      color: CustomColor.darkGreen,
                      border: Border.all(
                        color: CustomColor.darkGreen, // Set border color here
                        width: 2.0, // Set border width here
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      "View Record",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    margin: const EdgeInsets.only(left: 10, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(
                        color: Colors.redAccent, // Set border color here
                        width: 2.0, // Set border width here
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      "View Prescription",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
