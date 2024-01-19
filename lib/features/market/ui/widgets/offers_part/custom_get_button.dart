import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';


class CustomGetButton extends StatelessWidget {
  const CustomGetButton({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: height,
          bottom: height,
        ),
        decoration: BoxDecoration(
          color: ColorHelper.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'أحصل عليه',
          style: TextStyleHelper.font12RegularBackground,
        ),
      ),
    );
  }
}
