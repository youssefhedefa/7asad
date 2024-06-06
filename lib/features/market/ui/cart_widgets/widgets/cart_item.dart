import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/market/ui/cart_widgets/widgets/cart_item_head.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.imageUrl, required this.title, required this.quantity, required this.price, required this.id, required this.isFavourite, });

  final String imageUrl;
  final String title;
  final String quantity;
  final String price;
  final String id;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.sizeOf(context).height * 0.14,
        width: MediaQuery.sizeOf(context).width - 32,
        decoration: BoxDecoration(
          color: ColorHelper.cardBackgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(1, 3),
              spreadRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: CartItemHead(
          imageUrl: imageUrl,
          title: title,
          quantity: quantity,
          price: price,
          id: id,
          isFavourite: isFavourite,
        ),
      ),
    );
  }
}
