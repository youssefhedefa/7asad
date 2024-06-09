import 'package:final_project/core/constants.dart';
import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/models/user_data.dart';
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
                        controller: context.read<ProfileCubit>().nameController,
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
                        controller:
                            context.read<ProfileCubit>().jobDropDownController,
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
                        controller:
                            context.read<ProfileCubit>().universityController,
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
                        controller:
                            context.read<ProfileCubit>().educationController,
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
                        controller:
                            context.read<ProfileCubit>().townDropDownController,
                      ),
                      EditFieldItem(
                        label: 'رقم الهاتف ',
                        hint: 'مثال: 0100123456789',
                        controller:
                            context.read<ProfileCubit>().phoneNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'رقم الهاتف مطلوب';
                          }
                          return '';
                        },
                      ),
                      Form(
                        key: context.read<ProfileCubit>().experienceFormKey,
                        child: Column(
                          children: [
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
                                    addExperince(
                                      context: context,
                                      title: context
                                          .read<ProfileCubit>()
                                          .courseDropDownController
                                          .text,
                                      company: context
                                          .read<ProfileCubit>()
                                          .enterpriseDropDownController
                                          .text,
                                      startDate: context
                                          .read<ProfileCubit>()
                                          .fromDropDownController
                                          .text,
                                      endDate: context
                                          .read<ProfileCubit>()
                                          .toDropDownController
                                          .text,
                                    );
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'الوظيفة مطلوبة';
                                }
                                return null;
                              },
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'أسم الشركة مطلوب';
                                }
                                return null;
                              },
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
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) =>
                            experienceCard(context: context,index: index),
                        itemCount:
                            context.read<ProfileCubit>().user.experince!.length,
                      ),
                      const SizedBox(height: 18),
                      ActionButton(
                        onTap: () async {
                          updateUserData(context);
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

  Widget experienceCard({required BuildContext context,required int index}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(context.read<ProfileCubit>().user.experince![index].title!,
              style: TextStyleHelper.font12RegularDarkestGreen),
          Text(' // ', style: TextStyleHelper.font12RegularDarkestGreen),
          Text(context.read<ProfileCubit>().user.experince![index].company!,
              style: TextStyleHelper.font12RegularDarkestGreen),
          const Spacer(),
          Text('${context.read<ProfileCubit>().user.experince![index].startDate}//${context.read<ProfileCubit>().user.experince![index].endDate}', style: TextStyleHelper.font10RegularDarkestGreen),
          //const Spacer(),
          // InkWell(
          //   onTap: () {
          //     context.read<ProfileCubit>().experienceNumber--;
          //   },
          //   child: const Icon(
          //     Icons.close,
          //     size: 20,
          //   ),
          // )
        ],
      ),
    );
  }

  void updateUserData(BuildContext context) async {
    if (context.mounted) {
      context.read<ProfileCubit>().updateUserDataEmitStates(
            userData: User(
              name: context.read<ProfileCubit>().nameController.text.isEmpty
                  ? context.read<ProfileCubit>().user.name
                  : context.read<ProfileCubit>().nameController.text,
              job: context
                      .read<ProfileCubit>()
                      .jobDropDownController
                      .text
                      .isEmpty
                  ? context.read<ProfileCubit>().user.job
                  : context.read<ProfileCubit>().jobDropDownController.text,
              unviersity:
                  context.read<ProfileCubit>().universityController.text.isEmpty
                      ? context.read<ProfileCubit>().user.unviersity
                      : context.read<ProfileCubit>().universityController.text,
              faculty:
                  context.read<ProfileCubit>().facultyController.text.isEmpty
                      ? context.read<ProfileCubit>().user.faculty
                      : context.read<ProfileCubit>().facultyController.text,
              educationaldegree:
                  context.read<ProfileCubit>().educationController.text.isEmpty
                      ? context.read<ProfileCubit>().user.educationaldegree
                      : context.read<ProfileCubit>().educationController.text,
              country: context
                      .read<ProfileCubit>()
                      .countryDropDownController
                      .text
                      .isEmpty
                  ? context.read<ProfileCubit>().user.country
                  : context.read<ProfileCubit>().countryDropDownController.text,
              city: context
                      .read<ProfileCubit>()
                      .townDropDownController
                      .text
                      .isEmpty
                  ? context.read<ProfileCubit>().user.city
                  : context.read<ProfileCubit>().townDropDownController.text,
              phone: context.read<ProfileCubit>().user.phone,
              photo: context.read<ProfileCubit>().user.photo,
              background: context.read<ProfileCubit>().user.background,
              userRating: context.read<ProfileCubit>().user.userRating,
              role: context.read<ProfileCubit>().user.role,
              id: context.read<ProfileCubit>().user.id,
              date: context.read<ProfileCubit>().user.date,
              email: context.read<ProfileCubit>().user.email,
              v: context.read<ProfileCubit>().user.v,
              experince: context.read<ProfileCubit>().experince,
            ),
          );
    }
  }

  addExperince({
    required BuildContext context,
    required String title,
    required String company,
    required String startDate,
    required String endDate,
  }) {
    if(context.read<ProfileCubit>().experienceFormKey.currentState!.validate()){
      context.read<ProfileCubit>().experienceNumber++;
     // List<Experince>? experince = context.read<ProfileCubit>().experince;
      context.read<ProfileCubit>().experince.add(Experince(
        title: title,
        company: company,
        startDate: startDate,
        endDate: endDate,
      ),);
      print(context.read<ProfileCubit>().experince.length);

      context.read<ProfileCubit>().enterpriseDropDownController.clear();
      context.read<ProfileCubit>().courseDropDownController.clear();
      context.read<ProfileCubit>().fromDropDownController.clear();
      context.read<ProfileCubit>().toDropDownController.clear();
    }
    else{
      print('error');
    }

  }

}
