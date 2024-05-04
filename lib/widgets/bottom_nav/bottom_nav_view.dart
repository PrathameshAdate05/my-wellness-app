import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/widgets/bottom_nav/bottom_nav_controller.dart';
import 'package:my_wellness_mobile/widgets/bottom_nav/bottom_nav_item.dart';

class BottomNavView extends StatelessWidget {
  BottomNavController controller = Get.put(BottomNavController());

  BottomNavView(
      {super.key,
      required this.profile,
      required this.prescription,
      required this.records});

  bool profile = false;
  bool prescription = false;
  bool records = false;
  @override
  Widget build(BuildContext context) {
    controller.profile.value = profile;
    controller.prescription.value = prescription;
    controller.records.value = records;
    controller.context = context;
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavItem(
            image: "assets/images/user.png",
            onPressed: () => controller.onPressedProfile(),
            title: "Profile",
            isSelected: profile,
          ),
          BottomNavItem(
            image: "assets/images/medical_report.png",
            onPressed: () => controller.onPressedRecords(),
            title: "Records",
            isSelected: records,
          ),
          BottomNavItem(
            image: "assets/images/drugs.png",
            onPressed: () => controller.onPressedPrescriptions(),
            title: "Prescription",
            isSelected: prescription,
          ),
        ],
      ),
    );
  }
}
