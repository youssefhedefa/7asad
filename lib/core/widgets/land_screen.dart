import 'package:final_project/core/models/bottom_app_bar_item_model.dart';
import 'package:final_project/core/models/the_data_to_profile_as_visitor.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/bottom_app_bar_item.dart';
import 'package:final_project/core/widgets/custom_floating_action_button.dart';
import 'package:final_project/features/community/ui/community_screen.dart';
import 'package:final_project/features/market/ui/market_screen.dart';
import 'package:final_project/features/notification/ui/notification_and_appointment_screen.dart';
import 'package:final_project/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';

class LandScreen extends StatefulWidget {
  const LandScreen({super.key});

  @override
  State<LandScreen> createState() => _LandScreenState();
}

class _LandScreenState extends State<LandScreen> {

  int currentScreen = 0;

  List<BottomAppBarItemModel> items = [
    BottomAppBarItemModel(label: 'الرئسية', activeIcon: Icons.home, idleIcon: Icons.home_outlined),
    BottomAppBarItemModel(label: 'الأشعارات', activeIcon: Icons.notifications,idleIcon: Icons.notifications_outlined ),
    BottomAppBarItemModel(label: 'البروفايل', activeIcon: Icons.person,idleIcon: Icons.person_outline),
    BottomAppBarItemModel(label: 'السوق', activeIcon: Icons.store,idleIcon: Icons.store_outlined),
  ];


  List<Widget> screens =  [
    const CommunityScreen(),
    const NotificationAndAppointmentScreen(),
    ProfileScreen(
     dataToProfileAsVisitor:
      DataToProfileAsVisitor(
       isVisitor: false,
     ),
    ),
    const MarketScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
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
                        currentScreen = 0;
                        setState(() {
                        });
                      },
                      child: BottomAppBarItem(
                        model: items[0],
                        active: currentScreen == 0 ? true:false,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        currentScreen = 1;
                        setState(() {

                        });
                      },
                      child: BottomAppBarItem(
                        model: items[1],
                        active: currentScreen == 1 ? true:false,
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
                        currentScreen = 2;
                        setState(() {

                        });
                        //changeScreenCubit.changeScreen(currentScreen);
                      },
                      child: BottomAppBarItem(
                        model: items[2],
                        active: currentScreen == 2 ? true : false,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        currentScreen = 3;
                        setState(() {

                        });
                        //changeScreenCubit.changeScreen(currentScreen);
                      },
                      child: BottomAppBarItem(
                        model: items[3],
                        active: currentScreen == 3 ? true:false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens[currentScreen],
    );
  }
}
