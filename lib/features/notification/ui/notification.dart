import 'package:final_project/core/constants.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/notification/ui/widgets/notification_custom_widgets/notify_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        NotifyCard(
          type: Constants.confirmBookingType,
          onTap: (){
            setState(() {
              currentIndex = 6;
            });
          },
          isClicked: currentIndex == 6 ? true : false,
          personName: 'أحمد مهران',
          bookTime: '${DateFormat('EEEE').format(DateTime.now())} ${DateFormat('d/M/y').format(DateTime.now())}',
          reminderTime: '5:00 ص',
        ),
        NotifyCard(
          onTap: (){
            setState(() {
              currentIndex = 1;
            });
          },
          isClicked: currentIndex == 1 ? true : false,
          type: Constants.reminderType,
          personName: 'أحمد مهران',
          reminderTime: '5:00 ص',
        ),
        NotifyCard(
          type: Constants.alertType,
          onTap: (){
            setState(() {
              currentIndex = 2;
            });
          },
          isClicked: currentIndex == 2 ? true : false,
          personName: 'أحمد مهران',
          reminderTime: '5:00 ص',
        ),
        NotifyCard(
          type: Constants.streamType,
          onTap: (){
            setState(() {
              currentIndex = 3;
            });
          },
          isClicked: currentIndex == 3 ? true : false,
          personName: 'أحمد مهران',
          goToChat: (){
            Navigator.pushNamed(context, RoutesManager.chatBodyScreen);
          },
        ),
        NotifyCard(
          type: Constants.confirmBookingType,
          onTap: (){
            setState(() {
              currentIndex = 4;
            });
          },
          isClicked: currentIndex == 4 ? true : false,
          personName: 'أحمد مهران',
          bookTime: '${DateFormat('EEEE').format(DateTime.now())} ${DateFormat('d/M/y').format(DateTime.now())}',
          reminderTime: '5:00 ص',
        ),
        NotifyCard(
          type: Constants.cancelBookingType,
          onTap: (){
            setState(() {
              currentIndex = 5;
            });
          },
          isClicked: currentIndex == 5 ? true : false,
          personName: 'أحمد مهران',
          bookTime: '${DateFormat('EEEE').format(DateTime.now())} ${DateFormat('d/M/y').format(DateTime.now())}',
          reminderTime: '5:00 ص',
        ),
      ],
    );
  }
}
