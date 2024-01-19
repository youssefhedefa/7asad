import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'السوق',
          style: TextStyleHelper.font28BoldLightestGreen,
        ),
        const Spacer(),
        const CustomIcon(icon: Icons.favorite_outline),
        const SizedBox(width: 8),
        const CustomIcon(icon: Icons.shopping_cart_outlined),
      ],
    );
  }
}
