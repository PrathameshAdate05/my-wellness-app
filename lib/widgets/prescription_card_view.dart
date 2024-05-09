import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_wellness_mobile/data/models/prescription_model.dart';
import 'package:my_wellness_mobile/widgets/dashed_horizontal_line_printer.dart';
import 'package:my_wellness_mobile/widgets/medicine_details_view.dart';

class PrescriptionCardView extends StatelessWidget {
  PrescriptionCardView({required this.prescription});
  final Prescription prescription;
  @override
  Widget build(BuildContext context) {
    DateTime createdAtDateTime = DateTime.parse(prescription.createdAt);
    String formattedDate =
        DateFormat('yyyy-MM-dd hh:mm a').format(createdAtDateTime);
    return Card(
      margin: const EdgeInsets.all(10),
      surfaceTintColor: Colors.white,
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/medicine_icon.png",
                height: 50,
              ),
            ),
            Text(
              formattedDate,
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Column(
              children: prescription.medicines.map((medicine) {
                return Column(
                  children: [
                    MedicineDetailsView(medicine: medicine),
                    CustomPaint(
                      size: Size(Get.width, 2),
                      painter: DashedLineHorizontalPainter(
                          dashWidth: 3, dashSpace: 3, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              }).toList(), // Convert the map result into a list
            ),
          ],
        ),
      ),
    );
  }
}
