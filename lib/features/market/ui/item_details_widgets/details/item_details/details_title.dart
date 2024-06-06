import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class DetailsTitle extends StatelessWidget {
  const DetailsTitle ({super.key, required this.title, required this.available});

  final String title;
  final String available;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyleHelper.font22MediumDarkestGreen,
        ),
        const Spacer(),
        Text(
          'متوفر: $available طن',
          style: TextStyleHelper.font16RegularSuccessful,),
      ],
    );
  }
}
