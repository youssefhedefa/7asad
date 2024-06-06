import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/community/ui/widgets/profile_image_network_cach.dart';
import 'package:flutter/material.dart';

/// todo : remove this file

class PostCreationHeaderRow extends StatelessWidget {
  const PostCreationHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProfileImage(),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextField(
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'أكتب منشورك',
              hintStyle: TextStyleHelper.font16RegularDarkGreen,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
