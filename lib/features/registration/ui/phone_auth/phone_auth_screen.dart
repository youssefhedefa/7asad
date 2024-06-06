import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/registration/logic/auth_cubit/auth_cubit.dart';
import 'package:final_project/features/registration/ui/phone_auth/widgets/auth_listener.dart';
import 'package:final_project/features/registration/ui/phone_auth/widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key,required this.phone});

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'تأكيد الحساب',
        background: ColorHelper.primaryColor,
        whiteText: true,
      ),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                ' لقد أرسلنا كود ل $phone لتاكيد الحساب',
                style: TextStyleHelper.font22MediumDarkestGreen,
              ),
              const SizedBox(height: 16),
              Text(
                'يرجى كتابة الكود هنا',
                style: TextStyleHelper.font16MediumDarkGreen,
              ),
              const SizedBox(height: 8),
              CustomDigitForm(
                phoneNumber: phone,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                      'لم يصلك كود؟',
                    style: TextStyleHelper.font16MediumDarkGreen,
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: (){},
                    child: Text(
                        'ارسل مرة أخرى',
                      style: TextStyleHelper.font16MediumDarkGreen.copyWith(color: ColorHelper.primaryColor),
                    ),
                  ),
                ],
              ),
              const AuthListener(),
            ],
          ),
        ),
      ),
    );
  }
}
