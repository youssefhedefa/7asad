import 'package:final_project/features/market/ui/item_details_widgets/reviews/comments/comment_list.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/comments/create_comment.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/rating_bar.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/rating_start.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingStart(),
        CustomRatingBars(),
        CustomDivider(),
        CommentList(),
        CustomDivider(),
        CreateComment(),
      ],
    );
  }
}
