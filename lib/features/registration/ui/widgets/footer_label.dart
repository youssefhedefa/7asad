import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class FooterLabel extends StatelessWidget {
  const FooterLabel({super.key, required this.actionText, this.onTap, this.text = ''});

  final String actionText;
  final String? text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$text لديك حساب؟',
          style: TextStyleHelper.font16MediumDarkGreen,
        ),
        const SizedBox(width: 4,),
        GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                actionText,
                style: TextStyleHelper.font16MediumDarkGreen
                    .copyWith(color: ColorHelper.primaryColor),
              ),
              Container(
                height: 1,
                width: 96,
                color: ColorHelper.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
