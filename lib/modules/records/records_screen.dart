import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/records/records_controller.dart';
import 'package:my_wellness_mobile/utils/colors.dart';
import 'package:my_wellness_mobile/widgets/bottom_nav/bottom_nav_view.dart';
import 'package:my_wellness_mobile/widgets/record_card.dart';

class RecordsScreen extends StatelessWidget {
  final RecordsController controller = Get.find<RecordsController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return controller.getUserRecords();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "Records",
              style: TextStyle(fontFamily: "Poppins"),
            ),
          ),
          backgroundColor: CustomColor.lightGreen,
        ),
        body: Stack(children: [
          Obx(
            () => Container(
              margin: const EdgeInsets.only(bottom: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.recordsList.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => RecordCardView(
                                record: controller.recordsList[index],
                                onTapViewRecord: () => controller
                                    .onPressedViewRecord(context, index),
                                onTapViewPrescription: () => controller
                                    .onPressedViewPrescription(context, index)),
                            itemCount: controller.recordsList.length,
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
                                "No records available!!!",
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
              BottomNavView(profile: false, prescription: false, records: true),
            ],
          ),
        ]),
      ),
    );
  }
}
