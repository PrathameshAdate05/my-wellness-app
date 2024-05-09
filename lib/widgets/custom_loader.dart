import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomLoader extends StatelessWidget {
  late BuildContext? _context;

  void show(BuildContext context) {
    _context = context;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          content: Lottie.asset(
            'assets/json/loader_anim.json',
            height: 100,
            repeat: true,
          ),
        );
      },
    );
  }

  void hide() {
    if (_context != null) {
      Navigator.of(Get.context!).pop();
      _context = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container();
  }
}
