import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16,left: 24,right: 24,bottom: 12,),
      child: Text(
        label,
        style: TextStyleHelper.font22MediumDarkestGreen,
      ),
    );
  }
}
