import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ResultItemDetailsSellerInfo extends StatelessWidget {
  const ResultItemDetailsSellerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'البائع:محمد الشوال/طنطا',
          style: TextStyleHelper.font8RegularDarkestGreen ,
        ),
        Text(
          'احصل عليه يوم 27/6/2023',
          style: TextStyleHelper.font8RegularDarkestGreen ,
        ),
      ],
    );
  }
}
