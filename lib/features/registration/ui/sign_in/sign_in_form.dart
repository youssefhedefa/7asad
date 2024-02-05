import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/features/registration/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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
          ),
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
              if(value != password){
                confirmPasswordController.clear();
                return 'كلمه السر غير متطابقه';
              }
              else {
                return null;
              }
            },
          ),
          const SizedBox(height: 32,),
          ActionButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                  print('success');
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
