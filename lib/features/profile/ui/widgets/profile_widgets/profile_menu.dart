// ignore_for_file: avoid_print

import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert),
        );
      },
      menuChildren: [
        InkWell(
          onTap: () {
            print('تم مسح الحساب');
          },
          child: MenuItemButton(
            child: Text(
              'مسح الحساب',
              style: TextStyleHelper.font16MediumDarkGreen.copyWith(
                  color: Colors.black, fontWeight: FontWeightHelper.regular),
            ),
          ),
        ),
        BlocProvider.value(
          value:getIt<ProfileCubit>(),
          child: BlocBuilder<ProfileCubit,ProfileState>(
            builder:( context, state ){
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      print('تم تسجيل الخروج');
                      context.read<ProfileCubit>().emitLogOutStates(context);
                      Navigator.pushNamedAndRemoveUntil(context, RoutesManager.logInScreen, (route) => false);
                    },
                    child: MenuItemButton(
                      child: Text(
                        'تسجيل خروج',
                        style: TextStyleHelper.font16MediumDarkGreen.copyWith(
                            color: Colors.black, fontWeight: FontWeightHelper.regular),
                      ),
                    ),
                  ),
                  //const LogOutListener(),
                ],
              );
            }
          ),
        ),
        InkWell(
          onTap: () {
            print('المزيد');
          },
          child: MenuItemButton(
            child: Text(
              'المزيد',
              style: TextStyleHelper.font16MediumDarkGreen.copyWith(
                  color: Colors.black, fontWeight: FontWeightHelper.regular),
            ),
          ),
        ),
      ],
    );
  }
}
