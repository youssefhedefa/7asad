import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/registration/ui/log_in/log_in_form.dart';
import 'package:final_project/features/registration/ui/widgets/footer_label.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'تسجيل دخول',
        background: ColorHelper.primaryColor,
        hasLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مرحبا بعودتك!',
                style: TextStyleHelper.font28BoldLightestGreen.copyWith(
                  fontWeight: FontWeightHelper.medium,
                  color: ColorHelper.darkestGreenColor,
                ),
              ),
              Text(
                'سجل دخولك الأن للأستمرارك معنا ',
                style: TextStyleHelper.font16BoldDarkestGreen.copyWith(
                  fontWeight: FontWeightHelper.medium,
                  color: ColorHelper.darkGreenColor,
                ),
              ),
              const SizedBox(height: 24,),
              const LogInForm(),
              const SizedBox(height: 28,),
              FooterLabel(
                actionText: 'انشاء حساب',
                text: 'ليس',
                onTap: (){
                  Navigator.pushReplacementNamed(context, RoutesManager.signInScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}