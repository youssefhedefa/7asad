import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/education_container.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/experience_container.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/info_text.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/post_item/post_item.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/profile_photo_stack.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/statistics_row.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfilePhotoStack(),
              const InfoText(),
              const StatisticsRow(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24),
                child: ActionButton(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesManager.editProfileScreen);
                  },
                  label: 'تعديل الصفحه الشخصية',
                  outerColor: ColorHelper.primaryColor,
                  labelColor: Colors.white,
                ),
              ),
              const EducationContainer(),
              const ExperienceContainer(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  bottom: 16,
                  right: 16,
                ),
                child: Text(
                  'المنشورات',
                  style: TextStyleHelper.font18BoldDarkestGreen,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => const PostItem(),
                separatorBuilder: (_, index) => const SizedBox(
                  height: 16,
                ),
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
