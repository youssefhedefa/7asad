import 'package:final_project/core/models/bottom_app_bar_item_model.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({super.key, required this.model, required this.active});

  final BottomAppBarItemModel model;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: active ? ColorHelper.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Icon(
          active ? model.activeIcon : model.idleIcon,
          color: active ? ColorHelper.primaryColor :ColorHelper.darkGreenColor,
          size: 30,
        ),
        Text(
          model.label,
          style: active ? TextStyleHelper.font12RegularPrimary : TextStyleHelper.font12RegularDarkGreen,
        ),
      ],
    );
  }
}
