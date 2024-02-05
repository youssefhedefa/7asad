import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/custom_label.dart';
import 'package:final_project/features/scan/ui/widgets/appointment/consultant_list.dart';
import 'package:final_project/features/scan/ui/widgets/appointment/custom_appointment_grid.dart';
import 'package:final_project/features/scan/ui/widgets/appointment/custom_calendar.dart';
import 'package:flutter/material.dart';


class BookingAppointmentScreen extends StatelessWidget {
  const BookingAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'حجز معاد', background: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomCalendar(),
              const SizedBox(height: 12,),
              const CustomLabel(
                  label: 'المواعيد المتاحة',
                rightPadding: 0,
              ),
              const CustomAppointmentGrid(),
              const CustomLabel(
                label: 'الأستشارين المتاحين',
                rightPadding: 0,
              ),
              const ConsultantList(),
              const SizedBox(height: 40,),
              ActionButton(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, RoutesManager.confirmScreen);
                  },
                  label: 'تأكيد المعاد',
                  outerColor: ColorHelper.primaryColor,
                  labelColor: Colors.white,
              ),
              const SizedBox(height: 26,),
            ],
          ),
        ),
      ),
    );
  }
}
