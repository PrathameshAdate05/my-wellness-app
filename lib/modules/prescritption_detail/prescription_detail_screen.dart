import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_wellness_mobile/modules/prescritption_detail/prescription_detail_controller.dart';
import 'package:my_wellness_mobile/widgets/dashed_horizontal_line_printer.dart';
import 'package:my_wellness_mobile/widgets/medicine_details_view.dart';

class PrescriptionDetailScreen extends StatelessWidget {
  final PrescriptionDetailController controller =
      Get.find<PrescriptionDetailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          widthFactor: 1.5,
          child: Text(
            'Prescription Detail',
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset(
                "assets/images/medicine_icon.png",
                height: 50,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: DottedBorder(
                dashPattern: const [5],
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Column(
                    children: controller.temp.medicines.map((medicine) {
                      return Column(
                        children: [
                          MedicineDetailsView(medicine: medicine),
                          CustomPaint(
                            size: Size(Get.width, 2),
                            painter: DashedLineHorizontalPainter(
                                dashWidth: 3,
                                dashSpace: 3,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    }).toList(), // Convert the map result into a list
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
