import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/core/widgets/error_message.dart';
import 'package:final_project/features/registration/logic/log_in_cubit/log_in_cubit.dart';
import 'package:final_project/features/registration/logic/log_in_cubit/log_in_states.dart';
import 'package:final_project/features/registration/ui/log_in/log_in_form.dart';
import 'package:final_project/features/registration/ui/widgets/footer_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'تسجيل دخول',
        background: ColorHelper.primaryColor,
        hasLeading: false,
        whiteText: true,
      ),
      body: BlocBuilder<LogInCubit,LogInState>(
        builder: (BuildContext context, LogInState<dynamic> state) {
          return SingleChildScrollView(
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
                  context.read<LogInCubit>().errorHappen
                      ? CustomErrorMessage(
                    text: context.read<LogInCubit>().errorMessage,
                  )
                      : const SizedBox(),
                  const SizedBox(
                    height: 24,
                  ),
                  const LogInForm(),
                  const SizedBox(height: 28,),
                  FooterLabel(
                    actionText: 'انشاء حساب',
                    text: 'ليس',
                    onTap: (){
                      Navigator.pushNamed(context, RoutesManager.signInScreen);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
