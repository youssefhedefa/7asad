import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(8),
        border: Border.all(color: ColorHelper.medGreenColor,),
      ),
      child: Icon(
        icon,
        size: 22,
        color: ColorHelper.lightestGreenColor,
        weight: 8,
      ),
    );
  }
}
