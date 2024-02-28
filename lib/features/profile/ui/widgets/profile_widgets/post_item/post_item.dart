import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/post_item/interaction_buttons.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/post_item/interaction_statistics.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/post_item/post_content.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/post_item/post_images.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/post_item/publisher_info.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16,),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: ColorHelper.dividerColor),
          bottom: BorderSide(color: ColorHelper.dividerColor),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PublisherInfo(),
          PostContent(),
          PostImages(),
          InteractionStatistics(),
          CustomDivider(
            leftPadding: 0,
            rightPadding: 0,
            verticalPadding: 0
          ),
          SizedBox(height: 16),
          InteractionButtonsRow(),
        ],
      ),
    );
  }
}
