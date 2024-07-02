import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/notification/ui/appointments.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationAndAppointmentScreen extends StatelessWidget {
  const NotificationAndAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<PredictionCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'الأشعارات',
          background: Colors.white,
          hasLeading: false,
          sufixWidget: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesManager.chatScreen);
            },
            icon: const Icon(Icons.chat_outlined),
          ),
        ),
        body: const AppointmentsScreen(),
        // body: const Column(
        //   children: [
        //     Expanded(
        //       child: NavBar(
        //         horizontalPadding: 16,
        //         firstTap: 'المواعيد',
        //         secondTap: 'الأشعارات',
        //         screens: [
        //           NotificationScreen(),
        //           AppointmentsScreen(),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
