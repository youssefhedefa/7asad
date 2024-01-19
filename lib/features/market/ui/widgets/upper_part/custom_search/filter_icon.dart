import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';


class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key, required this.padding, required this.height});

   final EdgeInsetsGeometry padding;
   final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: ColorHelper.screenBackgroundColor,
          borderRadius: BorderRadius.circular(8)),
      padding: padding,
      child: Image.asset(IconHelper.filterIcon),
    );
  }
}


