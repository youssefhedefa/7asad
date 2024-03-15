import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/core/widgets/error_message.dart';
import 'package:final_project/features/registration/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:final_project/features/registration/logic/sign_in_cubit/sign_in_states.dart';
import 'package:final_project/features/registration/ui/sign_in/sign_in_form.dart';
import 'package:final_project/features/registration/ui/widgets/footer_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'انشاء حساب',
        background: ColorHelper.primaryColor,
        hasLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 32,
          ),
          child: BlocBuilder<SignInCubit, SingInState>(
            builder: (BuildContext context, SingInState<dynamic> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مرحبا بك!',
                    style: TextStyleHelper.font28BoldLightestGreen.copyWith(
                      fontWeight: FontWeightHelper.medium,
                      color: ColorHelper.darkestGreenColor,
                    ),
                  ),
                  Text(
                    'انضم لنا وقم بانشاء حساب جديد',
                    style: TextStyleHelper.font16BoldDarkestGreen.copyWith(
                      fontWeight: FontWeightHelper.medium,
                      color: ColorHelper.darkGreenColor,
                    ),
                  ),
                  context.read<SignInCubit>().errorHappen
                      ? CustomErrorMessage(
                          text: context.read<SignInCubit>().errorMessage,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 24,
                  ),
                  const SignInForm(),
                  const SizedBox(
                    height: 28,
                  ),
                  FooterLabel(
                    actionText: 'تسجيل دخول',
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesManager.logInScreen);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
