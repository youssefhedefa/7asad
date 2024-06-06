import 'package:final_project/core/models/the_data_to_profile_as_visitor.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/community/ui/widgets/profile_image_network_cach.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/upper_part/app_bar/custom_icon.dart';
import 'package:flutter/material.dart';

class PublisherInfo extends StatelessWidget {
  const PublisherInfo(
      {super.key,
      required this.name,
      required this.time,
      required this.imageUrl,
      required this.id});

  final String name;
  final String time;
  final String imageUrl;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.profileScreen,
          arguments: DataToProfileAsVisitor(
            isVisitor: (id != CachHelper.getId()),
            id: id,
          ),
        );
      },
      child: Row(
        children: [
          ProfileImage(
            imageUrl: imageUrl,
            radius: 24,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyleHelper.font16MediumDarkestGreen,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  //'منذ ١٢ دقيقة',
                  getDifference(date: time),
                  style: TextStyleHelper.font12MediumDarkestGreen,
                ),
              ],
            ),
          ),
          CustomIcon(
            icon: Icons.more_vert_outlined,
            borderColor: Colors.transparent,
            iconColor: ColorHelper.darkGreenColor,
            size: 28,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  String getDifference({required String date}) {
    DateTime givenDate = DateTime.parse(date);
    DateTime currentDate = DateTime.now();
    Duration difference = currentDate.difference(givenDate);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} دقائق ';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ساعات ';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ايام ';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} اسابيع ';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} شهور ';
    } else {
      return '${(difference.inDays / 365).floor()} اعوام ';
    }
  }
}
