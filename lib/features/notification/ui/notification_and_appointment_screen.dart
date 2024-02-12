import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/ui/item_details_widgets/nav_bar.dart';
import 'package:final_project/features/notification/ui/appointments.dart';
import 'package:final_project/features/notification/ui/notification.dart';
import 'package:flutter/material.dart';

class NotificationAndAppointmentScreen extends StatelessWidget {
  const NotificationAndAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'الأشعارات',
        background: Colors.white,
        sufixWidget: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesManager.chatScreen);
          },
          icon: const Icon(Icons.chat_outlined),
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: NavBar(
              horizontalPadding: 16,
              firstTap: 'المواعيد',
              secondTap: 'الأشعارات',
              screens: [
                NotificationScreen(),
                AppointmentsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
