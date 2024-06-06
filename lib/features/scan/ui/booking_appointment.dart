import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/core/widgets/custom_functions/functions.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/custom_label.dart';
import 'package:final_project/features/scan/data/models/appointment_request.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_cubit.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_state.dart';
import 'package:final_project/features/scan/ui/widgets/appointment/consultant_list.dart';
import 'package:final_project/features/scan/ui/widgets/appointment/custom_appointment_grid.dart';
import 'package:final_project/features/scan/ui/widgets/appointment/custom_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookingAppointmentScreen extends StatelessWidget {
  const BookingAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<PredictionCubit>(),
      child: BlocConsumer<PredictionCubit,PredictionState>(
        builder: (context,state) {
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
                          if(context.read<PredictionCubit>().consultantId == '' || context.read<PredictionCubit>().date == '' || context.read<PredictionCubit>().time == ''){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('من فضلك قم بتحديد المعاد والأستشاري')));
                          }
                          else{
                            context.read<PredictionCubit>().bookAppointment(
                              appointmentRequest: AppointmentRequest(
                                date: DateTime.parse(convertArabicToEnglish(input: context.read<PredictionCubit>().date)),
                                time: context.read<PredictionCubit>().time,
                                consultant: context.read<PredictionCubit>().consultantId,
                              )
                            );
                          }
                          //Navigator.pushReplacementNamed(context, RoutesManager.confirmScreen);
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
        },
        listener: (context,state){
          if(state is LoadingBookAppointment){
            showDialog(context: context, builder:
              (context) => const Center(child: CircularProgressIndicator(),),);
          }
          if(state is SuccessBookAppointment ){
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, RoutesManager.confirmScreen);
          }
        },

      ),
    );
  }
  String convertArabicToEnglish({required String input}) {
    const arabicNumerals = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const englishNumerals = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    for (int i = 0; i < arabicNumerals.length; i++) {
      input = input.replaceAll(arabicNumerals[i], englishNumerals[i]);
    }

    return input;
  }
}
