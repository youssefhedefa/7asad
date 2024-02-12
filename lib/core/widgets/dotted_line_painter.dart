import 'package:flutter/material.dart';

class CustomDottedLine extends StatelessWidget {
  final double height;
  final Color color;

  const CustomDottedLine({super.key, this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: DashedLinePainter(
          color: color,
          dashSpace: 2,
          dashHeight: 2,
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {

  final Color color;
  final double dashHeight;
  final double dashSpace;

  DashedLinePainter({super.repaint, required this.color, required this.dashHeight, required this.dashSpace});

  @override
  void paint(Canvas canvas, Size size) {
    //double dashWidth = dashWidth, dashSpace = dashSpace,
      double  startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}