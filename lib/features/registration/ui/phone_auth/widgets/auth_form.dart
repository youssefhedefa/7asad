// ignore_for_file: avoid_print
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/registration/logic/auth_cubit/auth_cubit.dart';
import 'package:final_project/features/registration/logic/auth_cubit/auth_state.dart';
import 'package:final_project/features/registration/ui/phone_auth/widgets/custom_digit_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDigitForm extends StatelessWidget {
  const CustomDigitForm({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
      builder: (BuildContext context, AuthState<dynamic> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomDigitField(
                    autoFocus: true,
                    focusNode: context.read<AuthCubit>().focusNode,
                    hasError: context.read<AuthCubit>().hasError,
                    controller: context.read<AuthCubit>().controllers[0],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDigitField(
                    controller: context.read<AuthCubit>().controllers[1],
                    hasError: context.read<AuthCubit>().hasError,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDigitField(
                    controller: context.read<AuthCubit>().controllers[2],
                    hasError: context.read<AuthCubit>().hasError,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDigitField(
                    controller: context.read<AuthCubit>().controllers[3],
                    hasError: context.read<AuthCubit>().hasError,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDigitField(
                    controller: context.read<AuthCubit>().controllers[4],
                    hasError: context.read<AuthCubit>().hasError,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDigitField(
                    controller: context.read<AuthCubit>().controllers[5],
                    hasError: context.read<AuthCubit>().hasError,
                    onChanged: (value) {
                      context.read<AuthCubit>().checkCode(context);
                      FocusScope.of(context).requestFocus(context.read<AuthCubit>().focusNode);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            context.read<AuthCubit>().hasError ? Text(
              'الكود غير صحيح',
              style: TextStyleHelper.font14RegularError,
            ) : const SizedBox(),
          ],
        );
      },
    );
  }
}
