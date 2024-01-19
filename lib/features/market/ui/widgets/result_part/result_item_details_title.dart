import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ResultItemDetailsTitle extends StatelessWidget {
  const ResultItemDetailsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'قمح خبز منقي',
          style: TextStyleHelper.font14MediumDarkestGreen,
        ),
        const SizedBox(width: 6),
        Text(
          'العدد:2 طن',
          style: TextStyleHelper.font12RegularDarkGreen,
        ),
      ],
    );
  }
}
