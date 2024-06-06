import 'package:final_project/features/market/ui/item_details_widgets/details/seller_row/seller_rating.dart';
import 'package:flutter/material.dart';

class SellerDetailsInfo extends StatelessWidget {
  const SellerDetailsInfo({super.key, required this.name, required this.sellerRating});

  final String name;
  //final String job;
  final double sellerRating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        // Text(
        //   job,
        //   style: TextStyleHelper.font12RegularDarkGreen,
        // ),
        SellerRating(
          rating: sellerRating,
        ),
      ],
    );
  }
}
