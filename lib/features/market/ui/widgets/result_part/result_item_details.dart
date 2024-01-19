import 'package:flutter/material.dart';
import 'result_item_details_description.dart';
import 'result_item_details_order.dart';
import 'result_item_details_seller_info.dart';
import 'result_item_details_title.dart';

class ResultItemDetails extends StatelessWidget {
  const ResultItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.only(
        start: 10,
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ResultItemDetailsTitle(),
          ResultItemDetailsDescription(),
          ResultItemDetailsSellerInfo(),
          ResultItemDetailsOrder(),
        ],
      ),
    );
  }
}
