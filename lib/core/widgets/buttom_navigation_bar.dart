import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/bottom_app_bar_item.dart';
import 'package:final_project/features/home/logic/manager/change_screen_cubit.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.changeScreenCubit});

  final ChangeScreenCubit changeScreenCubit;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 66,
      elevation: 18,
      shadowColor: Colors.grey,
      padding: const EdgeInsets.only(
        bottom: 9,
      ),
      surfaceTintColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorHelper.cardBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: (MediaQuery.sizeOf(context).width/2) - 20 ,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                        changeScreenCubit.currentScreen = 0;
                        changeScreenCubit.changeScreen(changeScreenCubit.currentScreen);
                    },
                    child: BottomAppBarItem(
                      model: changeScreenCubit.items[0],
                      active: changeScreenCubit.currentScreen == 0 ? true:false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                        changeScreenCubit.currentScreen = 1;
                        changeScreenCubit.changeScreen(changeScreenCubit.currentScreen);
                    },
                    child: BottomAppBarItem(
                      model: changeScreenCubit.items[1],
                      active: changeScreenCubit.currentScreen == 1 ? true:false,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: (MediaQuery.sizeOf(context).width/2) - 20 ,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                        changeScreenCubit.currentScreen = 2;
                        changeScreenCubit.changeScreen(changeScreenCubit.currentScreen);
                    },
                    child: BottomAppBarItem(
                      model: changeScreenCubit.items[2],
                      active: changeScreenCubit.currentScreen == 2 ? true : false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                        changeScreenCubit.currentScreen = 3;
                        changeScreenCubit.changeScreen(changeScreenCubit.currentScreen);
                    },
                    child: BottomAppBarItem(
                      model: changeScreenCubit.items[3],
                      active: changeScreenCubit.currentScreen == 3 ? true:false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
