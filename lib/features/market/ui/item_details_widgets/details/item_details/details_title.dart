import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class DetailsTitle extends StatelessWidget {
  const DetailsTitle ({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'قمح خبز منقي / كفر الشيخ',
      style: TextStyleHelper.font22MediumDarkestGreen,
    );
  }
}
