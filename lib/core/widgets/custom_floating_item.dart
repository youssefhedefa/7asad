import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.backGroundColor,
    required this.image,
    required this.borderColor,
    this.ratio,
  });

  final Color backGroundColor;
  final Color borderColor;
  final String image;
  final double? ratio;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorHelper.primaryColor),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundColor: backGroundColor,
        foregroundColor: backGroundColor,
        radius: 22,
        child: Image.asset(
          image,
          width: ratio,
          height: ratio,
        ),
      ),
    );
  }
}
