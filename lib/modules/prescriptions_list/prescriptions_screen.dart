import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/prescriptions_list/prescriptions_controller.dart';
import 'package:my_wellness_mobile/widgets/bottom_nav/bottom_nav_view.dart';
import 'package:my_wellness_mobile/widgets/prescription_card_view.dart';

class PrescriptionsScreen extends StatelessWidget {
  final PrescriptionsController controller =
      Get.find<PrescriptionsController>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return controller.getUserPrescriptions();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Prescriptions",
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          )),
          backgroundColor: Colors.redAccent,
          automaticallyImplyLeading: false,
        ),
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => PrescriptionCardView(
                    prescription: controller.prescriptionList[index],
                  ),
                  itemCount: controller.prescriptionList.length,
                ),
              ),
              BottomNavView(profile: false, prescription: true, records: false),
            ],
          ),
        ),
      ),
    );
  }
}
