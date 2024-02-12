import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0,left: 32,bottom: 8,top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: 58,
              width: 58,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    ImageHelper.mohamedImage,
                  ),
                ),
              )),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'ابراهيم أحمد',
                      style: TextStyleHelper.font16MediumDarkGreen,
                    ),
                    const Spacer(),
                    Text(
                      'ص04:30',
                      style: TextStyleHelper.font14RegularDarkestGreen,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      //Icons.check,
                      Icons.done_all,
                      color: ColorHelper.successfulColor,
                      size: 18,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Text(
                          ' النبات مصاب ب حشرة هاموش الأرز النبات مصاب ب حشرة هاموش الأرز ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleHelper.font12RegularDarkGreen.copyWith(
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.only(left: 7,right: 7,bottom: 7,top: 10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorHelper.primaryColor,
                      ),
                      child: Text(
                        '22',
                        textAlign: TextAlign.center,
                        style: TextStyleHelper.font12RegularBackground.copyWith(
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
