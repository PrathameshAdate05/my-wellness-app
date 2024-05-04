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
        body: Obx(
          () => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => RecordCardView(
                      record: controller.recordsList[index],
                      onTapViewRecord: () =>
                          controller.onPressedViewRecord(context, index),
                      onTapViewPrescription: () =>
                          controller.onPressedViewPrescription(context, index)),
                  itemCount: controller.recordsList.length,
                ),
              ),
              BottomNavView(profile: false, prescription: false, records: true),
            ],
          ),
        ),
      ),
    );
  }
}
