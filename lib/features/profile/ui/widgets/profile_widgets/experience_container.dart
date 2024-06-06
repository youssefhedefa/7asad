import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({super.key, required this.title, required this.companyName, required this.startDate, required this.endDate});

  final String title ;
  final String companyName ;
  final String startDate ;
  final String endDate ;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
      // decoration: const BoxDecoration(
      //     border: Border(
      //       bottom: BorderSide(color: ColorHelper.dividerColor,width: 2),
      //     )
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_,index)=> ExperienceItem(
                title: title,
                companyName: companyName,
                startDate: startDate,
                endDate: endDate,
              ),
            separatorBuilder: (_,index)=> const SizedBox(height: 4,),
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key, required this.title, required this.companyName, required this.startDate, required this.endDate});

  final String title;
  final String companyName;
  final String startDate;
  final String endDate;

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
            '$title \\ $companyName',
            style: TextStyleHelper.font18RegularDarkestGreen,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '$endDate \\ $startDate',
          style: TextStyleHelper.font12RegularDarkGreen,
        ),
      ],
    );
  }
}
