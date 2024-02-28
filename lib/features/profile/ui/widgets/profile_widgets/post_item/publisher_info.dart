import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class PublisherInfo extends StatelessWidget {
  const PublisherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0,bottom: 12),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
                ImageHelper.testProfileImage,
            ),
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 100,
                child: Text(
                  'اسماعيل الطوخي',
                  style: TextStyleHelper.font14MediumDarkestGreen,
                ),
              ),
              //const SizedBox(height: 2),
              Text(
                'منذ يومين',
                style: TextStyleHelper.font12MediumDarkGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
