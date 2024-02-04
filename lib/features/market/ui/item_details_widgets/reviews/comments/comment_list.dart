import 'package:final_project/features/market/ui/item_details_widgets/reviews/comments/comment_item.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  const CommentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const CommentItem(),
        separatorBuilder: (context, index) => const CustomDivider(),
        itemCount: 10);
  }
}
