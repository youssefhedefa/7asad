import 'package:bloc/bloc.dart';
import 'package:final_project/core/models/bottom_app_bar_item_model.dart';
import 'package:final_project/features/home/logic/manager/change_screen_states.dart';
import 'package:final_project/features/home/ui/home_screen.dart';
import 'package:final_project/features/market/ui/market_screen.dart';
import 'package:final_project/features/notification/ui/notification_and_appointment_screen.dart';
import 'package:final_project/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';

class ChangeScreenCubit extends Cubit<ChangeScreenStates>{

  ChangeScreenCubit() : super(ChangeScreenInitialState());

  int currentScreen = 1;

  List<BottomAppBarItemModel> items = [
    BottomAppBarItemModel(label: 'الرئسية', activeIcon: Icons.home, idleIcon: Icons.home_outlined),
    BottomAppBarItemModel(label: 'الأشعارات', activeIcon: Icons.notifications,idleIcon: Icons.notifications_outlined ),
    BottomAppBarItemModel(label: 'البروفايل', activeIcon: Icons.person,idleIcon: Icons.person_outline),
    BottomAppBarItemModel(label: 'السوق', activeIcon: Icons.store,idleIcon: Icons.store_outlined),
  ];


  List<Widget> screens = const [
    HomeScreen(),
    NotificationAndAppointmentScreen(),
    ProfileScreen(),
    MarketScreen(),
  ];

  Widget getView(){
    emit(ChangeScreenSuccessfulState());
    return screens[currentScreen];
  }

  void changeScreen(int index) {
    currentScreen = index;
    emit(ChangeScreenSuccessfulState());
  }

}