import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_wellness_mobile/modules/profile/profile_controller.dart';
import 'package:my_wellness_mobile/utils/colors.dart';
import 'package:my_wellness_mobile/widgets/bottom_nav/bottom_nav_view.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return controller.getPatientProfile();
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
                widthFactor: 5,
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Profile",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale: 1.3,
                        child: Switch(
                          trackColor: MaterialStateProperty.all(Colors.white),
                          inactiveThumbColor: Colors.white,
                          activeTrackColor: Colors.grey,
                          inactiveTrackColor: Colors.green,
                          activeThumbImage:
                              const AssetImage('assets/images/qr.png'),
                          inactiveThumbImage:
                              const AssetImage('assets/images/barcode.png'),
                          value: controller.isQR.value,
                          onChanged: (value) => controller.isQR.value = value,
                        ),
                      ),
                    ],
                  ),
                )),
            backgroundColor: CustomColor.lightGreen,
          ),
          body: Stack(
            children: [
              Obx(
                () => Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 80),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 130,
                          child: controller.isQR.value
                              ? SfBarcodeGenerator(
                                  value: controller.userId.toString(),
                                  symbology: QRCode(),
                                )
                              : SfBarcodeGenerator(
                                  symbology: Code128(),
                                  value: controller.userId.toString()),
                        ),
                        const SizedBox(height: 10),
                        showInfoView(
                            "Patient ID :", controller.patient.first.patientId),
                        showInfoView("Name:",
                            "${controller.patient.first.firstName} ${controller.patient.first.middleName} ${controller.patient.first.lastName}"),
                        showInfoView("Email :", controller.patient.first.email),
                        showInfoView(
                            "Contact :", controller.patient.first.contact),
                        showInfoView(
                            "Date of Birth :", controller.patient.first.dob),
                        showInfoView(
                            "Age :", controller.patient.first.age.toString()),
                        showInfoView(
                            "Gender :", controller.patient.first.gender),
                        showInfoView(
                            "Life Status :",
                            controller.patient.first.isAlive
                                ? "Alive"
                                : "Dead"),
                        showInfoView(
                            "Address :", controller.patient.first.address),
                        showInfoView("City :", controller.patient.first.city),
                        showInfoView("State :", controller.patient.first.state),
                        showInfoView(
                            "Pincode :", controller.patient.first.pincode),
                        showInfoView(
                            "Country :", controller.patient.first.country),
                        showInfoView("Account CreatedAt :",
                            controller.patient.first.createdAt),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () => controller.onPressedLogout(context),
                          child: Container(
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.red, // Change the color as needed
                              borderRadius: BorderRadius.circular(
                                  10), // Adjust the border radius as needed
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Logout",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors
                                          .white, // Change the text color as needed
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  BottomNavView(
                      profile: true, prescription: false, records: false)
                ],
              )
            ],
          )),
    );
  }

  Widget showInfoView(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14.0,
            color: CustomColor.extraDarkGreen,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
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
              value,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
