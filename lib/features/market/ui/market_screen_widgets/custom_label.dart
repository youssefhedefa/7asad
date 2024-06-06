import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel(
      {super.key,
      required this.label,
      this.rightPadding,
      this.hasViewAll = false});

  final String label;
  final double? rightPadding;
  final bool? hasViewAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      padding: EdgeInsets.only(
        top: 16,
        left: 24,
        right: rightPadding ?? 24,
        bottom: 12,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyleHelper.font22MediumDarkestGreen,
          ),
          const Spacer(),
          hasViewAll!
              ? GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        'عرض الكل',
                        style: TextStyleHelper.font14MediumPrimaryColor,
                      ),
                      Container(
                        width: 66,
                        height: 1.8,
                        color: ColorHelper.primaryColor,
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
