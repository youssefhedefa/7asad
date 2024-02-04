import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key, required this.label, this.rightPadding});

  final String label;
  final double? rightPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16,left: 24,right: rightPadding ?? 24,bottom: 12,),
      child: Text(
        label,
        style: TextStyleHelper.font22MediumDarkestGreen,
      ),
    );
  }
}
