import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: SizedBox(
        height: 66,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: ColorHelper.primaryColor,
              foregroundColor: ColorHelper.primaryColor,
              radius: 22,
              child: Image.asset(IconHelper.scanIcon),
            ),
            const Spacer(),
            Text(
                'المسح الضوئي',
              style: TextStyleHelper.font12RegularDarkGreen,

            ),
          ],
        ),
      ),
    );
  }
}
