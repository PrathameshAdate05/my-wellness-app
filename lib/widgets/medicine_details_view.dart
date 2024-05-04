import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/data/models/medicine_model.dart';
import 'package:my_wellness_mobile/utils/colors.dart';

class MedicineDetailsView extends StatelessWidget {
  final Medicine medicine;

  const MedicineDetailsView({super.key, required this.medicine});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name :",
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
              medicine.name,
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
              medicine.description,
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
      ],
    );
  }
}
