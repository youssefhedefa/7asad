import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:flutter/material.dart';

class CalculateDose extends StatelessWidget {
  const CalculateDose({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffDAF2EF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              'حساب كميه المنتج المناسبة',
            style: TextStyleHelper.font16BoldDarkestGreen,
          ),
          const SizedBox(height: 20,),
          Text(
              'أعرف الجرعة المناسبة و نسبة التخفيف لحجم الأرض',
            style: TextStyleHelper.font16BoldDarkestGreen.copyWith(fontWeight: FontWeightHelper.regular),
          ),
          const SizedBox(height: 20,),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width-110,
              child: ActionButton(
                onTap: (){},
                label: 'أحسب الجرعة',
                labelColor: Colors.white,
                outerColor: ColorHelper.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
