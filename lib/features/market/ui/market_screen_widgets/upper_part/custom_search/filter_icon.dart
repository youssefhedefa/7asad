import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';


class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key, required this.padding, required this.height, this.hasShadow = true});

   final EdgeInsetsGeometry padding;
   final double height;
   final bool? hasShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: ColorHelper.screenBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        boxShadow: hasShadow! ? [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 1.8, // Spread radius
            blurRadius: 7, // Blur radius
            offset: const Offset(0, 3), // Offset
          ),
        ] : [],
      ),
      padding: padding,
      child: Image.asset(IconHelper.filterIcon),
    );
  }
}


