import 'package:final_project/features/market/ui/cart_widgets/widgets/cart_image.dart';
import 'package:final_project/features/market/ui/cart_widgets/widgets/cart_item_details.dart';
import 'package:flutter/material.dart';

class CartItemHead extends StatelessWidget {
  const CartItemHead({super.key, required this.imageUrl, required this.title, required this.quantity, required this.price, required this.id, required this.isFavourite, });

  final String imageUrl;
  final String title;
  final String quantity;
  final String price;
  final String id;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 30,
          child: CartImage(
            imageUrl: imageUrl,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 70,
          child: CartItemDetails(
            title: title,
            quantity: quantity,
            price: price,
            id:  id,
            isFavourite: isFavourite,
          ),
        ),
      ],
    );
  }
}
