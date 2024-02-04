import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';


class CustomGetButton extends StatelessWidget {
  const CustomGetButton({super.key, required this.height, required this.width, this.onTap});

  final double height;
  final double width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: width+1,
          right: width+1,
          top: height+2,
          bottom: height,
        ),
        decoration: BoxDecoration(
          color: ColorHelper.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          textAlign: TextAlign.center,
          'أحصل عليه',
          style: TextStyleHelper.font12RegularBackground,
        ),
      ),
    );
  }
}
