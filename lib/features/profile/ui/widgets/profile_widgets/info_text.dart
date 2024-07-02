import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key, required this.name, required this.job, required this.city, required this.country, required this.placeNull});

  final String name;
  final String job;
  final String city;
  final String country;
  final bool placeNull;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyleHelper.font18BoldDarkestGreen,
          ),
          const SizedBox(height: 8,),
          Text(
            job,
            style: TextStyleHelper.font14RegularDarkGreen,
          ),
          const SizedBox(height: 8,),
          placeWidget(),
        ],
      ),
    );
  }
  String place(){
    if(placeNull){
      return ' ';
    }
    else {
      return '$city \\ $country';
    }
  }

  Widget placeWidget(){
    if(placeNull){
      return const SizedBox();
    }
    else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.place,
            color: ColorHelper.darkGreenColor,
          ),
          const SizedBox(width: 3,),
          Text(
            //'كفر الشيخ \\ بيلا',
            '$city \\ $country',
            //'${CachHelper.getRemainUserInfo()![2]} \\ ${CachHelper.getRemainUserInfo()![3]}',
            style: TextStyleHelper.font14RegularDarkGreen,
          ),
        ],
      );
    }
  }
}
