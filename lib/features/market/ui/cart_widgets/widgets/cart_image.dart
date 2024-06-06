import 'package:flutter/material.dart';

class CartImage extends StatelessWidget {
  const CartImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          fit: BoxFit.fill,
          //image: AssetImage(ImageHelper.orangeImage),
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
