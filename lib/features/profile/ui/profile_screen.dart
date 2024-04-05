import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_state.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/profile_menu.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/education_container.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/experience_container.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/info_text.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/post_item/post_item.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/profile_photo_stack.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/statistics_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/profile_widgets/listeners/profile_listener.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProfileCubit>(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (BuildContext context, ProfileState<dynamic> state) {
          if (state is SuccessExperienceDataFromLocalStorage ||
              state is SuccessUserDataFromLocalStorage ||
              state is SuccessUpdateUserData
          ) {
            return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: ColorHelper.primaryColor,
                  statusBarIconBrightness: Brightness.light,
                ),
                automaticallyImplyLeading: false,
                toolbarHeight: 0,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfilePhotoStack(
                        background: context.read<ProfileCubit>().user.background ?? '',
                        image: context.read<ProfileCubit>().user.photo ?? '',
                      ),
                      InfoText(
                        name: context.read<ProfileCubit>().user.name ?? '',
                        job: context.read<ProfileCubit>().user.job ?? ' ',
                        city: context.read<ProfileCubit>().user.city ?? ' ',
                        country: context.read<ProfileCubit>().user.country ?? ' ',
                      ),
                      const StatisticsRow(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                          bottom: 24,
                          left: 28.0,
                          right: 20.0,
                        ),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width - 28 * 2,
                          child: Row(
                            children: [
                              const ProfileMenu(),
                              Expanded(
                                child: ActionButton(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutesManager.editProfileScreen,
                                    );
                                  },
                                  label: 'تعديل الصفحه الشخصية',
                                  outerColor: ColorHelper.primaryColor,
                                  labelColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          EducationContainer(
                            faculty: context.read<ProfileCubit>().user.faculty ?? ' ',
                            university: context.read<ProfileCubit>().user.unviersity ?? ' ',
                            degree: context.read<ProfileCubit>().user.educationalDegree ?? ' ',
                          ),
                          ExperienceContainer(
                            startDate: context.read<ProfileCubit>().experince.startDate ?? ' ',
                            endDate: context.read<ProfileCubit>().experince.endDate ?? ' ',
                            companyName: context.read<ProfileCubit>().experince.company ?? ' ',
                            title: context.read<ProfileCubit>().experince.title ?? ' ',
                          ),
                        ],
                      ),
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
                      const ProfileListener()
                    ],
                  ),
                ),
              ),
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: ColorHelper.primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
