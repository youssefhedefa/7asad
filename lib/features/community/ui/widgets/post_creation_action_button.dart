import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/upper_part/app_bar/custom_icon.dart';
import 'package:flutter/material.dart';
/// todo : remove this file
class PostCreationActionButton extends StatelessWidget {
  const PostCreationActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon(
          icon: Icons.image_outlined,
          borderColor: Colors.transparent,
          iconColor: ColorHelper.darkGreenColor,
          size: 34,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        CustomIcon(
          icon: Icons.camera_alt_outlined,
          borderColor: Colors.transparent,
          iconColor: ColorHelper.darkGreenColor,
          size: 34,
          onTap: () {},
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorHelper.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'نشر',
            style: TextStyleHelper.font16MediumWhite,
          ),
        ),
      ],
    );
  }
}
