import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/features/registration/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String phoneNumber = '';
  String password = '';

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
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
          const SizedBox(height: 32,),
          ActionButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                print('success');
                Navigator.pushReplacementNamed(context, RoutesManager.landScreen);
              } else {
                print('failure');
              }
            },
            label: 'تسجيل الدخول',
            outerColor: ColorHelper.primaryColor,
            labelColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
