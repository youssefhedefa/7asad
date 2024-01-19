import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'أحصل على 2طن من قمح الخبز المنقى بخصم ',
              style: TextStyleHelper.font14RegularDarkGreen,
            ),
            TextSpan(
              text: '22%',
              style: TextStyleHelper.font14RegularDis,
            ),
          ],
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
