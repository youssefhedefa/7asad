import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/appointment_card.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/custom_timer.dart';
import 'package:flutter/material.dart';

class CustomFullAppointmentCard extends StatelessWidget {
  const CustomFullAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 77,
            child: AppointmentCard(),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 21,
              child: CustomTimer(),
          ),
        ],
      ),
    );
  }
}
