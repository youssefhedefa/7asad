import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class DetailsDescription extends StatelessWidget {
  const DetailsDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyleHelper.font14RegularDarkGreen,
    );
  }
}
