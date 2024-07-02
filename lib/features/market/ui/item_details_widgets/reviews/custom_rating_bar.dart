import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.title, required this.percent, required this.color});

  final String title;
  final double percent;
  final List<Color> color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyleHelper.font12RegularDarkGreen,
        ),
        const Spacer(),
        LinearPercentIndicator(
          barRadius: const Radius.circular(4),
          width: MediaQuery.sizeOf(context).width - 120,
          animation: true,
          lineHeight: 12.0,
          animationDuration: 2000,
          percent: percent,
          //progressColor: ColorHelper.primaryColor,
          isRTL: true,
          backgroundColor: Colors.white,
          linearGradient: LinearGradient(
              colors: color,
          ),
        ),
      ],
    );
  }
}
