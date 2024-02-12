import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class PersonButton extends StatelessWidget {
  const PersonButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        //width: MediaQuery.sizeOf(context).width * 0.4,
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
        decoration: BoxDecoration(
          color: ColorHelper.discTextColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(ImageHelper.mohamedImage),
            ),
            const SizedBox(width: 4),
            Text(
                'ابراهيم سعد',
              style: TextStyleHelper.font12MediumDarkestGreen.copyWith(color: ColorHelper.lightestGreenColor),
            ),
            const SizedBox(width: 3),
            //const Spacer(),
            Transform.rotate(
              angle: 3.14,
              child: IconButton(
                  onPressed: (){},
                icon: const Icon(
                    Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
