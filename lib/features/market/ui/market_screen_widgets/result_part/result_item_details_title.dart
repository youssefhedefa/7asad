import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ResultItemDetailsTitle extends StatelessWidget {
  const ResultItemDetailsTitle({super.key, required this.title, required this.quantity});

  final String title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          //'قمح خبز منقي',
          title,
          style: TextStyleHelper.font16MediumDarkestGreen,
        ),
        const SizedBox(width: 6),
        Text(
          'العدد: $quantity وحده ',
          style: TextStyleHelper.font14MediumSuccess,
        ),
      ],
    );
  }
}
