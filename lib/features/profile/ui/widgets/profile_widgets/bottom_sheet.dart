import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/comment_field.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/comment_item.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 36,
        right: 16,
        left: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'التعليقات',
            style: TextStyleHelper.font16MediumDarkestGreen,
          ),
          const SizedBox(height: 22),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const CommunityCommentItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: 15,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const CommentField(),
          ),
        ],
      ),
    );
  }
}
