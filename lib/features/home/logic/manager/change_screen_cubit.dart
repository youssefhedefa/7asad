import 'package:bloc/bloc.dart';
import 'package:final_project/features/home/logic/manager/change_screen_states.dart';
import 'package:final_project/features/home/ui/home_screen.dart';
import 'package:final_project/features/market/ui/market_screen.dart';
import 'package:final_project/features/notification/ui/notification_screen.dart';
import 'package:final_project/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';

class ChangeScreenCubit extends Cubit<ChangeScreenStates>{

  ChangeScreenCubit() : super(ChangeScreenInitialState());

  int _currentScreen = 3;

  List<Widget> screens = const [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
    MarketScreen(),
  ];

  Widget getView(){
    emit(ChangeScreenSuccessfulState());
    return screens[_currentScreen];
  }

  void changeScreen(int index) {
    _currentScreen = index;
    emit(ChangeScreenSuccessfulState());
  }

}