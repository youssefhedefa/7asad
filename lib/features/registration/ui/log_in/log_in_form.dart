// ignore_for_file: avoid_print
import 'package:final_project/core/helpers/app_regex.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/features/registration/data/models/log_in_models/log_in_request_body.dart';
import 'package:final_project/features/registration/logic/log_in_cubit/log_in_cubit.dart';
import 'package:final_project/features/registration/ui/log_in/log_in_listener.dart';
import 'package:final_project/features/registration/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LogInCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'رقم الموبايل',
            controller: context.read<LogInCubit>().phoneNumberController,
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
          ),
          CustomTextFormField(
            label: 'كلمة السر',
            controller: context.read<LogInCubit>().passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'كلمه السر مطلوبه';
              }
              else {
                return null;
              }
            },
            obscureText: true,
          ),
          const SizedBox(
            height: 32,
          ),
          ActionButton(
            onTap: () {
              if (context.read<LogInCubit>().formKey.currentState!.validate()) {
                print('success');
                validateThenDoLogin(context);
              } else {
                print('failure');
              }
            },
            label: 'تسجيل الدخول',
            outerColor: ColorHelper.primaryColor,
            labelColor: Colors.white,
          ),
          const LogInListener(),
        ],
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    context.read<LogInCubit>().emitLogInStates(
          LoginRequestBody(
            phone: context.read<LogInCubit>().phoneNumberController.text,
            password: context.read<LogInCubit>().passwordController.text,
          ),
        );
  }
}
