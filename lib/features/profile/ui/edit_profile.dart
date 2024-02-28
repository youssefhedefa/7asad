// ignore_for_file: avoid_print

import 'package:final_project/core/constants.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/profile/ui/edit_profile_widget/edit_drop_down_item.dart';
import 'package:final_project/features/profile/ui/edit_profile_widget/edit_field_item.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int experienceNumber = 0;

  // todo: make model here to can make validation on field;

  TextEditingController nameController = TextEditingController();
  TextEditingController jobDropDownController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController countryDropDownController = TextEditingController();
  TextEditingController townDropDownController = TextEditingController();
  TextEditingController courseDropDownController = TextEditingController();
  TextEditingController enterpriseDropDownController = TextEditingController();
  TextEditingController fromDropDownController = TextEditingController();
  TextEditingController toDropDownController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final List<String> _countries = Constants.countriesList.map((country) => country.name).toList();
  final List<String> defaultRegoin = Constants.countriesList
      .firstWhere((country) => country.name == 'مصر')
      .regions
      .map((region)=> region).toList();

  int _selectedCountry = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'تعديل الصفحة الرئيسية',
        background: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditFieldItem(
                  label: 'الأسم ',
                  hint: 'مثال: أحمد اسماعيل',
                  controller: nameController,
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
                  controller: jobDropDownController,
                  menuItems: const ['مهندس زراعي','مزارع','استشاري أمراض','طالب','دكتور جامعة','باحث','مرشد زراعي'],
                ),
                EditFieldItem(
                  label: 'الجامعة ',
                  hint: 'مثال: كفر الشيخ',
                  controller: universityController,
                ),
                EditFieldItem(
                  label: 'الكلية ',
                  hint: 'مثال: زراعه',
                  controller: facultyController,
                ),
                EditFieldItem(
                  label: 'الدرجة التعليمة ',
                  hint: 'مثال: بكالوريوس',
                  controller: educationController,
                ),
                EditDropDownItem(
                  label: 'الدولة',
                  hintText: 'مثال: مصر',
                  controller: countryDropDownController,
                  menuItems: _countries,
                  onSelected: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedCountry = value;
                      });
                    }
                  },
                ),
                EditDropDownItem(
                  label: 'المدينة',
                  hintText: 'مثال: كفر الشيخ',
                  controller: townDropDownController,
                  //menuItems: const ['مهندس زراعي','','','','',''],
                  menuItems: countryDropDownController.text.toString().isEmpty ? defaultRegoin : Constants.countriesList
                      .firstWhere((country) => country.name == countryDropDownController.text.toString())
                      .regions
                      .map((region)=> region).toList(),

                ),
                EditFieldItem(
                  label: 'رقم الهاتف ',
                  hint: 'مثال: 0100123456789',
                  controller: phoneNumberController,
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
                        experienceNumber++;
                        setState(() {});
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
                EditDropDownItem(
                  label: 'الوظيفة\\ الكورس',
                  hintText: 'مثال:موظف ',
                  controller: courseDropDownController,
                  menuItems: const ['مهندس زراعي','','','','',''],

                ),
                const SizedBox(
                  height: 16,
                ),
                EditDropDownItem(
                  label: 'أسم الشركة',
                  hintText: 'مثال:الزراعة والحياة ',
                  controller: enterpriseDropDownController,
                  menuItems: const ['مهندس زراعي','','','','',''],

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
                      controller: fromDropDownController,
                      menuItems: Constants.years,
                    ),
                    EditDropDownItem(
                      label: 'الى',
                      width: (MediaQuery.sizeOf(context).width / 2) - 32,
                      hintText: 'مثال:2024 ',
                      controller: townDropDownController,
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 40,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 6,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                      experienceCard(),
                  itemCount: experienceNumber,
                ),
                const SizedBox(height: 18),
                ActionButton(
                  onTap: () {
                    if (formKey.currentState!.validate() &&
                        courseDropDownController.text.isNotEmpty &&
                        jobDropDownController.text.isNotEmpty &&
                        countryDropDownController.text.isNotEmpty &&
                        townDropDownController.text.isNotEmpty &&
                        courseDropDownController.text.isNotEmpty &&
                        enterpriseDropDownController.text.isNotEmpty &&
                        courseDropDownController.text.isNotEmpty &&
                        fromDropDownController.text.isNotEmpty &&
                        toDropDownController.text.isNotEmpty) {
                      print('Done');
                      print(courseDropDownController.text);
                      Navigator.pushNamed(context, RoutesManager.profileScreen);
                    } else {
                      print('false');
                    }
                  },
                  label: 'حفظ التعديلات ',
                  outerColor: ColorHelper.primaryColor,
                  labelColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget experienceCard() {
    return Container(
      width: (MediaQuery.sizeOf(context).width / 2) - 20,
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
              experienceNumber--;
              setState(() {});
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
}
