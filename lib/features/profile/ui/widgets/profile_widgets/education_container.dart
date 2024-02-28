import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class EducationContainer extends StatelessWidget {
  const EducationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(vertical: 22,horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorHelper.dividerColor,width: 2),
          top: BorderSide(color: ColorHelper.dividerColor,width: 2),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'التعليم',
            style: TextStyleHelper.font18BoldDarkestGreen,
          ),
          const SizedBox(height: 14),
           Row(
            children: [
              const Icon(
                  Icons.school_outlined,
                color: ColorHelper.darkGreenColor,
                size: 34,
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'كلية الزراعة \\ جامعة كفر الشيخ',
                        style: TextStyleHelper.font18RegularDarkestGreen,
                      ),
                      Text(
                        'بكالوريوس',
                        style: TextStyleHelper.font18RegularDarkGreen,
                      ),
                    ],
                  ),
              ),
              const SizedBox(width: 8),
              Text(
                  '2022 \\ 2018',
                style: TextStyleHelper.font12RegularDarkGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
