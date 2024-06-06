import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/dotted_line_painter.dart';
import 'package:flutter/material.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time,
          style: TextStyleHelper.font16MediumDarkGreen
              .copyWith(color: ColorHelper.darkestGreenColor),
        ),
        const SizedBox(height: 4),
        CustomDottedLine(
          height: MediaQuery.sizeOf(context).height * 0.165 - 10,
          color: ColorHelper.darkGreenColor,
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: TextStyleHelper.font16MediumDarkGreen,
        ),
      ],
    );
  }
}
