
import 'package:final_project/core/constants.dart';
import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/hive/constance.dart';
import 'package:final_project/core/networking/local/hive/local_servics.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_state.dart';
import 'package:final_project/features/profile/ui/edit_profile_widget/edit_drop_down_item.dart';
import 'package:final_project/features/profile/ui/edit_profile_widget/edit_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/profile_widgets/listeners/edit_profile_listener.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProfileCubit>(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (BuildContext context, ProfileState<dynamic> state) {
          return Scaffold(
            appBar: const CustomAppBar(
              title: 'تعديل الصفحة الرئيسية',
              background: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: context.read<ProfileCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EditFieldItem(
                        label: 'الأسم ',
                        hint: 'مثال: أحمد اسماعيل',
                        controller:
                        context.read<ProfileCubit>().nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الاسم مطلوب';
                          }
                          return '';
                        },
                      ),
                      EditDropDownItem(
                        label: 'الوظيفة',
                        hintText: 'مثال: مهندس زراعي',
                        controller: context
                            .read<ProfileCubit>()
                            .jobDropDownController,
                        menuItems: const [
                          'مهندس زراعي',
                          'مزارع',
                          'استشاري أمراض',
                          'طالب',
                          'دكتور جامعة',
                          'باحث',
                          'مرشد زراعي'
                        ],
                      ),
                      EditFieldItem(
                        label: 'الجامعة ',
                        hint: 'مثال: كفر الشيخ',
                        controller: context
                            .read<ProfileCubit>()
                            .universityController,
                      ),
                      EditFieldItem(
                        label: 'الكلية ',
                        hint: 'مثال: زراعه',
                        controller:
                        context.read<ProfileCubit>().facultyController,
                      ),
                      EditFieldItem(
                        label: 'الدرجة التعليمة ',
                        hint: 'مثال: بكالوريوس',
                        controller: context
                            .read<ProfileCubit>()
                            .educationController,
                      ),
                      EditFieldItem(
                        label: 'الدولة',
                        hint: 'مثال: مصر',
                        controller: context
                            .read<ProfileCubit>()
                            .countryDropDownController,
                      ),
                      EditFieldItem(
                        label: 'المدينة',
                        hint: 'مثال: كفر الشيخ',
                        controller: context
                            .read<ProfileCubit>()
                            .townDropDownController,
                      ),
                      EditFieldItem(
                        label: 'رقم الهاتف ',
                        hint: 'مثال: 0100123456789',
                        controller: context
                            .read<ProfileCubit>()
                            .phoneNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'رقم الهاتف مطلوب';
                          }
                          return '';
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الخبرة',
                            style: TextStyleHelper.font22MediumDarkestGreen
                                .copyWith(color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<ProfileCubit>()
                                  .experienceNumber++;
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      EditFieldItem(
                        label: 'الوظيفة \\ الكورس',
                        hint: 'مثال:موظف ',
                        controller: context
                            .read<ProfileCubit>()
                            .courseDropDownController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      EditFieldItem(
                        label: 'أسم الشركة',
                        hint: 'مثال:الزراعة والحياة ',
                        controller: context
                            .read<ProfileCubit>()
                            .enterpriseDropDownController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          EditDropDownItem(
                            label: 'من',
                            width: (MediaQuery.sizeOf(context).width / 2) - 32,
                            hintText: 'مثال:2020 ',
                            controller: context
                                .read<ProfileCubit>()
                                .fromDropDownController,
                            menuItems: Constants.years,
                          ),
                          EditDropDownItem(
                            label: 'الى',
                            width: (MediaQuery.sizeOf(context).width / 2) - 32,
                            hintText: 'مثال:2024 ',
                            controller: context
                                .read<ProfileCubit>()
                                .toDropDownController,
                            menuItems: Constants.years,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 40,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 6,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            experienceCard(context),
                        itemCount:
                        context.read<ProfileCubit>().experienceNumber,
                      ),
                      const SizedBox(height: 18),
                      ActionButton(
                        onTap: () async {
                          updateUserData(context);
                          //await updateData().then((value) => print('done')).error((error) => print(error.toString()));
                        },
                        label: 'حفظ التعديلات ',
                        outerColor: ColorHelper.primaryColor,
                        labelColor: Colors.white,
                      ),
                      const EditProfileListener(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget experienceCard(BuildContext context) {
    return Container(
      width: (MediaQuery.sizeOf(context).width / 2),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text('موظف/', style: TextStyleHelper.font10RegularDarkestGreen),
          Text('الزراعة والحياة/',
              style: TextStyleHelper.font10RegularDarkestGreen),
          Text('2020//2024', style: TextStyleHelper.font10RegularDarkestGreen),
          const Spacer(),
          InkWell(
            onTap: () {
              context.read<ProfileCubit>().experienceNumber--;
            },
            child: const Icon(
              Icons.close,
              size: 20,
            ),
          )
        ],
      ),
    );
  }

  void updateUserData(BuildContext context) async {

    User user = await LocalServices.getData(
      box: LocalBox.userBox,
      key: KeysConstance.userKey,
    );
    Experince experince = await LocalServices.getData(
      box: LocalBox.exprienceBox,
      key: KeysConstance.experinceKey,
    );

    if (context.mounted) {
      context.read<ProfileCubit>().updateUserDataEmitStates(
            userData: User(
              name: context.read<ProfileCubit>().nameController.text.isEmpty
                  ? user.name
                  : context.read<ProfileCubit>().nameController.text,
              job: context
                      .read<ProfileCubit>()
                      .jobDropDownController
                      .text
                      .isEmpty
                  ? user.job
                  : context.read<ProfileCubit>().jobDropDownController.text,
              unviersity: context
                      .read<ProfileCubit>()
                      .universityController
                      .text
                      .isEmpty
                  ? user.unviersity
                  : context.read<ProfileCubit>().universityController.text,
              faculty: context
                      .read<ProfileCubit>()
                      .facultyController
                      .text
                      .isEmpty
                  ? user.faculty
                  : context.read<ProfileCubit>().facultyController.text,
              educationalDegree: context
                      .read<ProfileCubit>()
                      .educationController
                      .text
                      .isEmpty
                  ? user.educationalDegree
                  : context.read<ProfileCubit>().educationController.text,
              country: context
                      .read<ProfileCubit>()
                      .countryDropDownController
                      .text
                      .isEmpty
                  ? user.country
                  : context
                      .read<ProfileCubit>()
                      .countryDropDownController
                      .text,
              city: context
                      .read<ProfileCubit>()
                      .townDropDownController
                      .text
                      .isEmpty
                  ? user.city
                  : context
                      .read<ProfileCubit>()
                      .townDropDownController
                      .text,
              phone: user.phone,
              photo: user.photo,
              background: user.background,
              userRating: user.userRating,
              role: user.role,
              id: user.id,
              date: user.date,
              email: user.email,
              iV: user.iV,
              experince: Experince(
                title: context
                        .read<ProfileCubit>()
                        .courseDropDownController
                        .text
                        .isEmpty
                    ? experince.title
                    : context
                        .read<ProfileCubit>()
                        .courseDropDownController
                        .text,
                company: context
                        .read<ProfileCubit>()
                        .enterpriseDropDownController
                        .text
                        .isEmpty
                    ? experince.company
                    : context
                        .read<ProfileCubit>()
                        .enterpriseDropDownController
                        .text,
                startDate: context
                        .read<ProfileCubit>()
                        .fromDropDownController
                        .text
                        .isEmpty
                    ? experince.startDate
                    : context
                        .read<ProfileCubit>()
                        .fromDropDownController
                        .text,
                endDate: context
                        .read<ProfileCubit>()
                        .toDropDownController
                        .text
                        .isEmpty
                    ? experince.endDate
                    : context
                        .read<ProfileCubit>()
                        .toDropDownController
                        .text,
              ),
            ),
          );
    }
  }

}
