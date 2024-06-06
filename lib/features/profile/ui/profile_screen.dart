import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/models/chat_model.dart';
import 'package:final_project/core/models/the_data_to_profile_as_visitor.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
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
import 'package:final_project/features/profile/ui/widgets/profile_widgets/profile_photo_stack.dart';
import 'package:final_project/features/profile/ui/widgets/profile_widgets/statistics_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/profile_widgets/listeners/profile_listener.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.dataToProfileAsVisitor,});

  final DataToProfileAsVisitor dataToProfileAsVisitor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProfileCubit>()..emitGetProfileState(
        id: dataToProfileAsVisitor.isVisitor ? dataToProfileAsVisitor.id! : CachHelper.getId(),
      ),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (BuildContext context, ProfileState<dynamic> state) {
          if (state is Success ||
              state is SuccessUpdateUserData ||
              state is SuccessUpdateBackGroundImage ||
              state is SuccessUpdatePersonalImage) {
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
                        background: context
                                .read<ProfileCubit>()
                                .user
                                .background ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHrMqwA2X-_g537_jV6dciihxDmX4PUTQD6Q&s',
                        image: context.read<ProfileCubit>().user.photo ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQljYSrXL1AK2EzLXxKDtbl3hrFbLphwvqzmw&s',
                      ),
                      InfoText(
                        name: context.read<ProfileCubit>().user.name ?? '',
                        job: context.read<ProfileCubit>().user.job ?? ' ',
                        city: context.read<ProfileCubit>().user.city ?? ' ',
                        country:
                            context.read<ProfileCubit>().user.country ?? ' ',
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
                                    onButtonTap(context);
                                    // Navigator.pushNamed(
                                    //   context,
                                    //   RoutesManager.editProfileScreen,
                                    // );
                                  },
                                  label: dataToProfileAsVisitor.isVisitor ? 'ارسال رسالة' :'تعديل الصفحه الشخصية',
                                  outerColor: ColorHelper.primaryColor,
                                  labelColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EducationContainer(
                            faculty:
                                context.read<ProfileCubit>().user.faculty ??
                                    ' ',
                            university:
                                context.read<ProfileCubit>().user.unviersity ??
                                    ' ',
                            degree: context
                                    .read<ProfileCubit>()
                                    .user
                                    .educationaldegree ??
                                ' ',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 24,
                                right: 16.0,
                            ),
                            child: Text(
                              'الخبرة',
                              style: TextStyleHelper.font18BoldDarkestGreen,
                            ),
                          ),
                          Column(
                            children: experiences(context),
                          ),
                        ],
                      ),
                      const Divider(
                          color: ColorHelper.dividerColor,
                          thickness: 2,
                        height: 2,
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
                        //itemBuilder: (_, index) => const PostItem(),
                        itemBuilder: (_, index) => const SizedBox(),
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
          else if(state is Loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: ColorHelper.primaryColor,
              ),
            );
          }
          else {
            return Center(
              child: Text(
                  ' حدث خطأ ما يرجى المحاولة مرة اخرى',
                style : TextStyleHelper.font22MediumDarkestGreen
              ),
            );
          }
        },
      ),
    );
  }

  List<Widget> experiences(BuildContext context) {
    List<Widget> list = [];
    if (context.read<ProfileCubit>().experince.isNotEmpty) {
      for (int i = 0;
          i < context.read<ProfileCubit>().experince.length;
          i++) {
        list.add(
          ExperienceContainer(
            startDate:
                context.read<ProfileCubit>().experince[i].startDate ??
                    ' ',
            endDate:
                context.read<ProfileCubit>().experince[i].endDate ?? ' ',
            companyName:
                context.read<ProfileCubit>().experince[i].company ?? ' ',
            title: context.read<ProfileCubit>().experince[i].title ?? ' ',
          ),
        );
      }
      return list;
    } else {
      return [const SizedBox()];
    }
  }

  onButtonTap(BuildContext context){
    if(dataToProfileAsVisitor.isVisitor){
      Navigator.pushNamed(context, RoutesManager.chatBodyScreen, arguments: ChatBodyModel(
          name: context.read<ProfileCubit>().user.name ?? 'اليوزر ملوش اسم',
          id: dataToProfileAsVisitor.id ?? '6625feb2629a73b4555a0de2',
          image: context.read<ProfileCubit>().user.photo ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQljYSrXL1AK2EzLXxKDtbl3hrFbLphwvqzmw&s',
      ),
      );
    }
    else{
      Navigator.pushNamed(context, RoutesManager.editProfileScreen);
    }
  }

}
