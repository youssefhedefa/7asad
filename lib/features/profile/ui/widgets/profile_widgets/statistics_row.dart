import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class StatisticsRow extends StatelessWidget {
  const StatisticsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 84.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatisticsItem(label: 'اعجاب',number: 33000),
          StatisticsItem(label: 'يتابع',number: 92),
          StatisticsItem(label: 'متابع',number: 240),
        ],
      ),
    );
  }
}

class StatisticsItem extends StatelessWidget {
  const StatisticsItem({super.key, required this.label, required this.number});

  final String label;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getStatisticsNumber(number),
          style: TextStyleHelper.font24BoldDarkestGreen,
        ),
        Text(
            label,
          style: TextStyleHelper.font14RegularDarkGreen,
        ),
      ],
    );
  }

  String getStatisticsNumber(int number){
    String stringNumber = number.toString();

    if(number > 1000000){
      stringNumber = stringNumber.substring(0, stringNumber.length - 6);
      stringNumber = '${stringNumber}M';
    }
    else if(number > 1000){
      stringNumber = stringNumber.substring(0, stringNumber.length - 3);
      stringNumber = '${stringNumber}K';
    }

    return stringNumber;
  }

}
