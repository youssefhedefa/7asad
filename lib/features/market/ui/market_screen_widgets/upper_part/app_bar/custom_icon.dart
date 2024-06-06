import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.borderColor,
    this.size = 22,
  });

  final IconData icon;
  final void Function() onTap;
  final Color? iconColor;
  final Color? borderColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(8),
          border: Border.all(
            color: borderColor ?? ColorHelper.medGreenColor,
          ),
        ),
        child: Icon(
          icon,
          size: size,
          color: iconColor ?? ColorHelper.lightestGreenColor,
          weight: 8,
        ),
      ),
    );
  }
}
