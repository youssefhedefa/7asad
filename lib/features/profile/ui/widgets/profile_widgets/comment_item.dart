import 'package:final_project/core/constants.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/community/ui/widgets/profile_image_network_cach.dart';
import 'package:flutter/material.dart';

class CommunityCommentItem extends StatelessWidget {
  const CommunityCommentItem({super.key, required this.user, required this.content});

  final User user;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileImage(
          imageUrl: user.photo ?? Constants.imageStatic,
          radius: 24,
        ),
        const SizedBox(width: 4),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: ColorHelper.commentBgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width - 132,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                        user.name ?? '',
                      style: TextStyleHelper.font16MediumDarkestGreen,
                    ),
                    const Spacer(),
                    MenuAnchor(
                      builder:
                          (BuildContext context, MenuController controller, Widget? child) {
                        return IconButton(
                          onPressed: () {
                            if (controller.isOpen) {
                              controller.close();
                            } else {
                              controller.open();
                            }
                          },
                          icon: const Icon(Icons.more_vert),
                        );
                      }, menuChildren: const [],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                    content,
                  style: TextStyleHelper.font16RegularDarkestGreen,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
