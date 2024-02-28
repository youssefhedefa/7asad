import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Text(
              'اسماعيل الطوخي',
            style: TextStyleHelper.font18BoldDarkestGreen,
          ),
          const SizedBox(height: 8,),
          Text(
              'مهندس زراعي',
            style: TextStyleHelper.font14RegularDarkGreen,
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                  Icons.place,
                color: ColorHelper.darkGreenColor,
              ),
              const SizedBox(width: 3,),
              Text(
                  'كفر الشيخ \\ بيلا',
                style: TextStyleHelper.font14RegularDarkGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
