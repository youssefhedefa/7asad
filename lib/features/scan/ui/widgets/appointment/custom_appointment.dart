import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomAppointment extends StatelessWidget {
  const CustomAppointment({super.key, required this.backgroundColor, required this.textColor, required this.time, required this.isAm});

  final Color backgroundColor;
  final Color textColor;
  final String time;
  final bool isAm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$time ${isAm ? 'ص' : 'م'}',
        style: TextStyleHelper.font14MediumDarkestGreen.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
