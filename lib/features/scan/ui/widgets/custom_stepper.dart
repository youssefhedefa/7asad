import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key, required this.icon, required this.text, this.isEnd});

  final String icon;
  final String text;
  final bool? isEnd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  icon,
                  width: 18,
                  height: 18,
                ),
                isEnd == true ? const SizedBox() : const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: VerticalDivider(
                      color: ColorHelper.darkGreenColor,
                      thickness: 1,
                      width: 1,

                    ),
                  ),
                ),
                const SizedBox(height: 2),
              ],
            ),
            const SizedBox(width: 8,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      text,
                    style: TextStyleHelper.font14MediumDarkestGreen,
                  ),
                  const SizedBox(height: 16,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
