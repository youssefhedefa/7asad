import 'package:final_project/core/models/default_user.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/custom_full_appointment_card.dart';
import 'package:final_project/features/notification/ui/widgets/appointment_custom_widgets/weekly_calendar.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_cubit.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {

  @override
  void initState() {
    context.read<PredictionCubit>().getUserAppointments();
    context.read<PredictionCubit>().getAppointmentsByDate(date: DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PredictionCubit,PredictionState>(
      builder: (context,state) {
        if(state is LoadingUserAppointment || state is LoadingUserAppointmentByDate) {
          return const Center(child: CircularProgressIndicator());
        }
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
            Expanded(
              child: ListView.separated(
                itemCount: context.read<PredictionCubit>().appointmentsByDate.length,
                itemBuilder: (_,index) => CustomFullAppointmentCard(
                  time: context.read<PredictionCubit>().appointmentsByDate[index].time.toString(),
                  consultant: context.read<PredictionCubit>().appointmentsByDate[index].consultant ?? defaultUser(),
                ),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16),
              ),
            ),
          ],
        );
      }
    );
  }
}
