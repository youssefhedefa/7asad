import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class InteractionButton extends StatelessWidget {
  const InteractionButton({super.key, required this.icon, required this.label, this.onTap});

  final Widget icon;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          icon,
          Text(
            label,
            style: TextStyleHelper.font12MediumDarkGreen,
          ),
        ],
      ),
    );
  }
}
