import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/dotted_line_painter.dart';
import 'package:flutter/material.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '10:00ص',
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
          '10:30ص',
          style: TextStyleHelper.font16MediumDarkGreen,
        ),
      ],
    );
  }
}
