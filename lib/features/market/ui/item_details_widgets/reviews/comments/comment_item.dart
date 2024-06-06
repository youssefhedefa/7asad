import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/comments/comment_text.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.name, required this.date, required this.comment});

  final String name;
  final String date;
  final String comment;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //const SellerImage(),
            const SizedBox(
              width: 10
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 120,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      //SellerRating(),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    date,
                    style: TextStyleHelper.font12RegularDarkGreen,
                  ),
                ],
              ),
            ),
          ],
        ),
        CommentText(
          comment: comment,
        ),
      ],
    );
  }
}
