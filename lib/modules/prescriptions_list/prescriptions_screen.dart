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
        body: Stack(children: [
          Obx(
            () => Container(
              margin: const EdgeInsets.only(bottom: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.prescriptionList.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                PrescriptionCardView(
                              prescription: controller.prescriptionList[index],
                            ),
                            itemCount: controller.prescriptionList.length,
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/no_records.jpg",
                                height: 200,
                              ),
                              const Text(
                                "No prescriptions available!!!",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              BottomNavView(profile: false, prescription: true, records: false),
            ],
          )
        ]),
      ),
    );
  }
}
