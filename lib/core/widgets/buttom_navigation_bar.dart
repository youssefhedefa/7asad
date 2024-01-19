import 'package:final_project/core/models/bottom_app_bar_item_model.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/bottom_app_bar_item.dart';
import 'package:final_project/features/home/logic/manager/change_screen_cubit.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.changeScreenCubit});

  final ChangeScreenCubit changeScreenCubit;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  List<BottomAppBarItemModel> items = [
    BottomAppBarItemModel(label: 'الرئسية', activeIcon: Icons.home, idleIcon: Icons.home_outlined),
    BottomAppBarItemModel(label: 'الأشعارات', activeIcon: Icons.notifications,idleIcon: Icons.notifications_outlined ),
    BottomAppBarItemModel(label: 'البروفايل', activeIcon: Icons.person,idleIcon: Icons.person_outline),
    BottomAppBarItemModel(label: 'السوق', activeIcon: Icons.store,idleIcon: Icons.store_outlined),
  ];

  int currentIndex = 3;

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
                      setState(() {
                        currentIndex = 0;
                        widget.changeScreenCubit.changeScreen(currentIndex);
                      });
                    },
                    child: BottomAppBarItem(
                      model: items[0],
                      active: currentIndex == 0 ? true:false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                        widget.changeScreenCubit.changeScreen(currentIndex);
                      });
                    },
                    child: BottomAppBarItem(
                      model: items[1],
                      active: currentIndex == 1 ? true:false,
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
                      setState(() {
                        currentIndex = 2;
                        widget.changeScreenCubit.changeScreen(currentIndex);
                      });
                    },
                    child: BottomAppBarItem(
                      model: items[2],
                      active: currentIndex == 2 ? true : false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                        widget.changeScreenCubit.changeScreen(currentIndex);
                      });
                    },
                    child: BottomAppBarItem(
                      model: items[3],
                      active: currentIndex == 3 ? true:false,
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
