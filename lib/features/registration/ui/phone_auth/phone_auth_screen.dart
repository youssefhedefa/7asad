import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/registration/data/phone_auth_model.dart';
import 'package:final_project/features/registration/ui/phone_auth/widgets/custom_digit_form.dart';
import 'package:flutter/material.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key, required this.phoneAuthModel});

  final PhoneAuthModel phoneAuthModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'تأكيد الحساب',
        background: ColorHelper.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ' لقد أرسلنا كود ل ${phoneAuthModel.phoneNumber} لتاكيد الحساب',
              style: TextStyleHelper.font22MediumDarkestGreen,
            ),
            const SizedBox(height: 16),
            Text(
              'يرجى كتابة الكود هنا',
              style: TextStyleHelper.font16MediumDarkGreen,
            ),
            const SizedBox(height: 8),
            CustomDigitForm(
              phoneNumber: phoneAuthModel.phoneNumber,
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
          ],
        ),
      ),
    );
  }
}
