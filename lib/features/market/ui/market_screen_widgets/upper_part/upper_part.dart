import 'package:final_project/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'custom_search/custom_search_field_row.dart';

class UpperPart extends StatelessWidget {
  const UpperPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
     // height: MediaQuery.sizeOf(context).height * 0.20,
      padding: const EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 18,
        bottom: 24,
      ),
      decoration: const BoxDecoration(
        //color: ColorHelper.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RoutesManager.searchScreen);
        },
          child: const CustomSearchFieldRow(
            enabled: false,
          ),
      ),
    );
  }
}
