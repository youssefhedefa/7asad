// ignore_for_file: avoid_print
import 'package:final_project/core/helpers/app_regex.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_request_body.dart';
import 'package:final_project/features/registration/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:final_project/features/registration/ui/sign_in/sign_in_listener.dart';
import 'package:final_project/features/registration/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignInCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'الأسم الثنائي',
            controller: context.read<SignInCubit>().fullNameController,
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
            controller: context.read<SignInCubit>().phoneNumberController,
            type: TextInputType.phone,
            inputFormatters: [
              LengthLimitingTextInputFormatter(11),
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'رقم الموبايل مطلوب';
              }
              else if(!AppRegex.isPhoneValid(value)){
                return 'من فضلك ادخل رقم موبايل صحيح';
              }
              else {
                return null;
              }
            },
          ), // phone number
          CustomTextFormField(
            label: 'كلمة السر',
            controller: context.read<SignInCubit>().passwordController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'كلمه السر مطلوبه';
              }
              else if(!AppRegex.isPasswordValid(value)){
                return 'من فضلك ادخل كلمه سر تحتوي علي حروف وارقام\n وتتكون من اكتر من 7 حروف';
              }
              else {
                return null;
              }
            },
          ),
          CustomTextFormField(
            label: 'تأكيد كلمة السر',
            controller: context.read<SignInCubit>().confirmPasswordController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'من فضلك ادخل كلمه السر بشكل صحيح';
              }
              if (value != context.read<SignInCubit>().passwordController.text.toString()) {
                context.read<SignInCubit>().confirmPasswordController.clear();
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
              if (context.read<SignInCubit>().formKey.currentState!.validate()) {
                print('Success');
                validateThenDoSignin(context);
              }
              else {
                print('failure');
              }
            },
            label: 'انشاء حساب',
            outerColor: ColorHelper.primaryColor,
            labelColor: Colors.white,
          ),
          const SignInListener(),
        ],
      ),
    );
  }
  void validateThenDoSignin(BuildContext context) {
    context.read<SignInCubit>().emitSignInStates(
      SignInRequestBody(
        email: 'default@gmail.com',
        name: context.read<SignInCubit>().fullNameController.text.trim(),
        password: context.read<SignInCubit>().passwordController.text,
        passwordConfirm: context.read<SignInCubit>().confirmPasswordController.text,
        phone: context.read<SignInCubit>().phoneNumberController.text,
      ),context
    );
  }

}
