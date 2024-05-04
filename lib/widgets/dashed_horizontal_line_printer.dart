import 'package:flutter/material.dart';

class DashedLineHorizontalPainter extends CustomPainter {
  DashedLineHorizontalPainter(
      {required this.dashWidth, required this.dashSpace, required this.color});

  double dashWidth;
  double dashSpace;
  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = this.dashWidth;
    double dashSpace = this.dashSpace;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
