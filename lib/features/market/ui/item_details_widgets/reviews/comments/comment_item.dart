import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/seller_row/seller_image.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/seller_row/seller_rating.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/comments/comment_text.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SellerImage(),
            const SizedBox(
              width: 10
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 120,
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'محمد الشوال',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SellerRating(),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    '7/12/2023',
                    style: TextStyleHelper.font12RegularDarkGreen,
                  ),
                ],
              ),
            ),
          ],
        ),
        const CommentText(),
      ],
    );
  }
}
