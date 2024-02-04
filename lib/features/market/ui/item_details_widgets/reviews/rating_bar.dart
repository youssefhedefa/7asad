import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class CustomRatingBars extends StatelessWidget {
  const CustomRatingBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.18,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(
        top: 24,
        right: 8,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomRatingBar(title: 'ممتاز', percent: 0.8, color: ColorHelper.excellentColor,),
          CustomRatingBar(title: 'جيد جدا', percent: 0.6, color: ColorHelper.veryGoodColor,),
          CustomRatingBar(title: 'جيد', percent: 0.4, color: ColorHelper.goodColor,),
          CustomRatingBar(title: 'سئ', percent: 0.2, color: ColorHelper.badColor,),
          CustomRatingBar(title: 'سئ جدا', percent: 0.5, color: ColorHelper.veryBadColor,),
        ],
      ),
    );
  }
}
