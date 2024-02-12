import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {

  final Color color;

  TrianglePainter({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const double startX = 0;
    final double startY = size.height;
    final double endX = size.width;
    final double endY = size.height;
    const double apexX = 0;
    const double apexY = 0;

    Path path = Path();
    path.moveTo(startX, startY); // Start at the bottom-left corner
    path.lineTo(endX, endY); // Draw a line to the bottom-right corner
    path.lineTo(apexX, apexY); // Draw a line to the top-left corner (apex)
    path.close(); // Close the path to form a triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}