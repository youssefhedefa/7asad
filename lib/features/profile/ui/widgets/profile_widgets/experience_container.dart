import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(vertical: 22,horizontal: 16),
      decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorHelper.dividerColor,width: 2),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'الخبرة',
            style: TextStyleHelper.font18BoldDarkestGreen,
          ),
          const SizedBox(height: 14),
          ListView.separated(
            itemCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_,index)=> const ExperienceItem(),
            separatorBuilder: (_,index)=> const SizedBox(height: 4,),
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(
            Icons.signal_cellular_alt_rounded,
          size: 32,
          color: ColorHelper.primaryColor,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            'تدريب \\ مركز البحوث الزراعية',
            style: TextStyleHelper.font18RegularDarkestGreen,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '2022 \\ 2018',
          style: TextStyleHelper.font12RegularDarkGreen,
        ),
      ],
    );
  }
}
