import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

import 'app_bar/custom_app_bar.dart';
import 'custom_search/custom_search_field_row.dart';

class UpperPart extends StatelessWidget {
  const UpperPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.25,
      padding: const EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 18,
        bottom: 26,
      ),
      decoration: const BoxDecoration(
        color: ColorHelper.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: const Column(
        children: [
          CustomAppBar(),
          Spacer(),
          CustomSearchFieldRow(),
        ],
      ),
    );
  }
}
