import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8,left: 16,bottom: 12,top: 4),
      child: Text(
          content,
        style: TextStyleHelper.font14RegularDarkGreen.copyWith(color: Colors.black),
      ),
    );
  }
}
