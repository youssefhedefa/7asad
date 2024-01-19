import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

import 'result_item_details.dart';
import 'result_item_image.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 18,
        left: 18,
        bottom: 8,
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height* 0.175,
        padding: const EdgeInsetsDirectional.only(
          start: 8,
          end: 12,
          top: 12,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: ColorHelper.cardBackgroundColor,
          boxShadow: const [
             BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(1, 3),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          children: [
            Expanded(
              flex: 35,
                child: ResultItemImage(),
            ),
            Expanded(
              flex: 65,
              child: ResultItemDetails(),),

          ],
        ),
      ),
    );
  }
}

