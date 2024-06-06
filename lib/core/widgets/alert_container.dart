import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class AlertContainer extends StatelessWidget {
  const AlertContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(12),
      //alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorHelper.alertColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            IconHelper.alertIcon,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 100,
            child: RichText(
              text: TextSpan(
                text: 'تنبيه: ',
                style: TextStyleHelper.font16RegularDis,
                children: [
                  TextSpan(
                    text: text,
                    style: TextStyleHelper.font14RegularDarkGreen,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
