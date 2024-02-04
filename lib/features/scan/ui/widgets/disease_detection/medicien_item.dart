import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class MedicienItem extends StatelessWidget {
  const MedicienItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12,),
      decoration: BoxDecoration(
        color: ColorHelper.cardBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 30,
            child: Image.asset(
                ImageHelper.testMedicienItemImage,
            ),
          ),
          Expanded(
            flex: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'مبيد حشري',
                  style: TextStyleHelper.font12RegularDarkGreen,
                ),
                Text(
                    'بروفين 600',
                  style: TextStyleHelper.font16BoldDarkestGreen,
                ),
                Text(
                  'المواد الفعالة : هيالورنيك أسيد , سالسليك أسيد',
                  style: TextStyleHelper.font14RegularDarkGreen,
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 10,
              child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ],
      ),
    );
  }
}
