import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.label, required this.active});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 36,
            width: (MediaQuery.sizeOf(context).width / 2) - 20,
            child: Text(
                label,
              textAlign: TextAlign.center,
              style: TextStyleHelper.font14RegularDarkGreen,
            ),
          ),
          const Spacer(),
          active ? Container(
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorHelper.primaryColor,
            ),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
