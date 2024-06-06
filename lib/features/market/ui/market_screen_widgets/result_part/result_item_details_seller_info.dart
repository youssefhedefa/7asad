import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ResultItemDetailsSellerInfo extends StatelessWidget {
  const ResultItemDetailsSellerInfo({super.key, required this.name, required this.city});

  final String name;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Text(
      'البائع: $name /$city',
      style: TextStyleHelper.font12RegularDarkestGreen ,
    );
  }
}
