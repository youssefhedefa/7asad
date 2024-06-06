import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:flutter/material.dart';
import 'result_item_details_description.dart';
import 'result_item_details_order.dart';
import 'result_item_details_seller_info.dart';
import 'result_item_details_title.dart';

class ResultItemDetails extends StatelessWidget {
  const ResultItemDetails({super.key, required this.product,});

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 10,
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ResultItemDetailsTitle(
            title: product.name!,
            quantity: product.amount!.toInt(),
          ),
          ResultItemDetailsDescription(
            description: product.description!,
          ),
          ResultItemDetailsSellerInfo(
            name: product.user?.name ?? 'مفيش يوزر',
            city: product.place ?? 'مفيش مدينة',
          ),
          ResultItemDetailsOrder(
            price: product.oneItemPrice!.toInt(),
          ),
        ],
      ),
    );
  }
}
