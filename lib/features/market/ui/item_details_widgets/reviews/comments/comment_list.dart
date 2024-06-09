import 'package:final_project/core/models/default_user.dart';
import 'package:final_project/features/market/data/models/reviews/review_response.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/comments/comment_item.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  const CommentList({super.key, required this.reviews});

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => CommentItem(
            name: reviews[index].user?.name ?? defaultUser().name!,
            date: '${reviews[index].createdAt!.year}-${reviews[index].createdAt!.month}-${reviews[index].createdAt!.day}',
            comment: reviews[index].review!
        ),
        separatorBuilder: (context, index) => const CustomDivider(),
        itemCount: reviews.length);
  }
}
