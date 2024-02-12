import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/custom_full_appointment_card.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/weekly_calendar.dart';
import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const WeeklyCalendar(),
        const CustomDivider(
          verticalPadding: 18,
          rightPadding: 22,
          leftPadding: 22,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (_,index) => const CustomFullAppointmentCard(),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16),
        ),
      ],
    );
  }
}
