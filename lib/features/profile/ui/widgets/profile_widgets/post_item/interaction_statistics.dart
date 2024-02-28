import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class InteractionStatistics extends StatelessWidget {
  const InteractionStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 16, top: 16),
      child: Row(
        children: [
          const Spacer(),
          InteractionStatisticsItem(
            icon: Image.asset(
              IconHelper.shareIcon,
              height: 24,
              width: 24,
            ),
            statisticsNumber: 15,
          ),
          const SizedBox(width: 12),
          const InteractionStatisticsItem(
            icon: Icon(
              Icons.comment_outlined,
              color: ColorHelper.darkGreenColor,
            ),
            statisticsNumber: 15,
          ),
          const SizedBox(width: 12),
          const InteractionStatisticsItem(
            icon: Icon(
              Icons.favorite_outline,
              color: ColorHelper.darkGreenColor,
            ),
            statisticsNumber: 15,
          ),
        ],
      ),
    );
  }
}

class InteractionStatisticsItem extends StatelessWidget {
  const InteractionStatisticsItem(
      {super.key, required this.icon, required this.statisticsNumber});

  final Widget icon;
  final int statisticsNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          statisticsNumber.toString(),
          style: TextStyleHelper.font14MediumDarkestGreen,
        ),
        const SizedBox(width: 4),
        icon,
      ],
    );
  }
}
