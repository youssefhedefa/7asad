import 'package:final_project/core/constants.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/community/ui/widgets/post_item/interaction_buttons.dart';
import 'package:final_project/features/community/ui/widgets/post_item/interaction_statistics.dart';
import 'package:final_project/features/community/ui/widgets/post_item/post_content.dart';
import 'package:final_project/features/community/ui/widgets/post_item/publisher_info.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.publisher, required this.content, required this.image, required this.comments, required this.time, required this.postId, required this.likesList});

  final User publisher;
  final String content;
  final String image;
  final String time;
  final int comments;
  final String postId;
  final List<dynamic> likesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 8,
        end: 12,
        top: 12,
        bottom: 14,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: ColorHelper.dividerColor),
          bottom: BorderSide(color: ColorHelper.dividerColor),
        ),
        color: ColorHelper.cardBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(1, 3),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PublisherInfo(
            name: publisher.name!,
            time: time,
           // imageUrl: publisher.photo ?? 'https://static.vecteezy.com/system/resources/previews/036/594/092/non_2x/man-empty-avatar-photo-placeholder-for-social-networks-resumes-forums-and-dating-sites-male-and-female-no-photo-images-for-unfilled-user-profile-free-vector.jpg',
            imageUrl: publisher.photo ?? Constants.imageStatic,
            id: publisher.id!,
          ),
          const SizedBox(height: 8),
          PostContent(
            content: content,
          ),
          //PostImages(),
          image == 'no' || image == '' ? const SizedBox() :
          SinglePostImage(
            image: image,
          ),
          InteractionStatistics(
            likes: likesList.length,
            comments: comments,
          ),
          const CustomDivider(
            leftPadding: 0,
            rightPadding: 0,
            verticalPadding: 0
          ),
          const SizedBox(height: 16),
          InteractionButtonsRow(
            postId: postId,
            likes: likesList,
          ),
        ],
      ),
    );
  }
}

class SinglePostImage extends StatelessWidget {
  const SinglePostImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.35/1,
      child: Image.network(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
