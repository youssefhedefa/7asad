import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/custom_label.dart';
import 'package:flutter/material.dart';

class CustomDividerWithLabel extends StatelessWidget {
  const CustomDividerWithLabel({super.key, required this.text, this.verticalPadding});

  final String text;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CustomDivider(
          verticalPadding: verticalPadding,
        ),
        Row(
          children: [
            Image.asset(
              IconHelper.pointerIcon,
              width: 14,
              height: 21,
            ),
            CustomLabel(
              label: text,
              rightPadding: 6,
            ),
          ],
        ),
      ],
    );
  }
}
