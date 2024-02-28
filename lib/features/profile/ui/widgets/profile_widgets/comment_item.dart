import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/community_comment_actions.dart';
import 'package:flutter/material.dart';

class CommunityCommentItem extends StatelessWidget {
  const CommunityCommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            ImageHelper.testProfileImage,
          ),
        ),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12
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
                            'اسماعيل الطوخي',
                          style: TextStyleHelper.font14MediumDarkestGreen,
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
                    const SizedBox(height: 10),
                    Text(
                        'اشتريت محصول قمح امبارح ازاي اعرف انو درجه اولى اشتريت محصول قمح امبارح ازاي اعرف',
                      style: TextStyleHelper.font14RegularDarkestGreen,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                            'منذ يومين',
                          style: TextStyleHelper.font10RegularDarkGreen,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const CommunityCommentActions(),
          ],
        ),
      ],
    );
  }
}
