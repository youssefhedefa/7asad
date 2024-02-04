import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SellerRating extends StatelessWidget {
  const SellerRating({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 2,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      //itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      ignoreGestures: true,
      itemSize: 12,
      onRatingUpdate: (double value) {},
    );
  }
}
