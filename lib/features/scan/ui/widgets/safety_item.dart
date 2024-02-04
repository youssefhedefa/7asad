import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class SafetyItem extends StatelessWidget {
  const SafetyItem({super.key, required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        children: [
          Image.asset(
              icon,
            height: 30,
            width: 30,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 8),
          Text(
              text,
            style: TextStyleHelper.font14MediumDarkestGreen,
          ),
        ],
      ),
    );
  }
}
