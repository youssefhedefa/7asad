import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/upper_part/custom_search/filter_icon.dart';
import 'package:flutter/material.dart';

class ResultLabel extends StatelessWidget {
  const ResultLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 18,start: 18,top: 12,),
      child: Row(
        children: [
          Text(
              'الكل',
            style: TextStyleHelper.font22RegularDarkestGreen,
          ),
          const Spacer(),
          const FilterIcon(
            padding: EdgeInsets.zero,
            height: 36,
          ),
        ],
      ),
    );
  }
}
