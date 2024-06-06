import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/appointment_card.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/custom_timer.dart';
import 'package:flutter/material.dart';

class CustomFullAppointmentCard extends StatelessWidget {
  const CustomFullAppointmentCard({super.key, required this.time,  required this.consultant});

  final String time;
  final User consultant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 77,
            child: AppointmentCard(
              consultant: consultant,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 21,
              child: CustomTimer(
                time: time,
              ),
          ),
        ],
      ),
    );
  }
}
