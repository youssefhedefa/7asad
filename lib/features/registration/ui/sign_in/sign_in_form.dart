// ignore_for_file: avoid_print

import 'package:final_project/core/networking/remote/firebase_services.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/features/registration/data/phone_auth_model.dart';
import 'package:final_project/features/registration/logic/auth_services.dart';
import 'package:final_project/features/registration/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String fullName = '';
  String phoneNumber = '';
  String password = '';
  String confirmPassword = '';

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'الأسم بالكامل',
            controller: fullNameController,
            onChange: (value) {
              fullName = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'اسمك بالكامل مطلوب';
              } else {
                return null;
              }
            },
          ),
          CustomTextFormField(
            label: 'رقم الموبايل',
            controller: phoneNumberController,
            type: TextInputType.phone,
            inputFormatters: [
              LengthLimitingTextInputFormatter(11),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChange: (value) {
              phoneNumber = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'رقم الموبايل مطلوب';
              } else {
                return null;
              }
            },
          ), // phone number
          CustomTextFormField(
            label: 'كلمة السر',
            controller: passwordController,
            onChange: (value) {
              password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'كلمه السر مطلوبه';
              } else {
                return null;
              }
            },
          ),
          CustomTextFormField(
            label: 'تأكيد كلمة السر',
            controller: confirmPasswordController,
            onChange: (value) {
              confirmPassword = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'من فضلك ادخل كلمه السر بشكل صحيح';
              }
              if (value != password) {
                confirmPasswordController.clear();
                return 'كلمه السر غير متطابقه';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 32,
          ),
          ActionButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                //firebaseServices.phoneAuth(phoneNumber: phoneNumber, context: context);

                AuthService.sendOTP(
                  phoneNumber: phoneNumberController.text,
                  errorStep: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'error in sending opt',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  nextStep: (){
                    Navigator.pushNamed(context, RoutesManager.phoneAuthScreen,arguments: PhoneAuthModel(phoneNumber: phoneNumber,));
                  },
                );
              } else {
                print('failure');
              }
            },
            label: 'انشاء حساب',
            outerColor: ColorHelper.primaryColor,
            labelColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
