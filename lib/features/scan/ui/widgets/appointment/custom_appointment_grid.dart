import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_cubit.dart';
import 'package:final_project/features/scan/ui/widgets/appointment/custom_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppointmentGrid extends StatefulWidget {
  const CustomAppointmentGrid({super.key});

  @override
  State<CustomAppointmentGrid> createState() => _CustomAppointmentGridState();
}

class _CustomAppointmentGridState extends State<CustomAppointmentGrid> {

  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (30 * 2) + 16,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 30,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: (){
            setState(() {
              currentIndex = index;
            });
            context.read<PredictionCubit>().time = '${index + 1}.30';
          },
          child: CustomAppointment(
            backgroundColor: currentIndex == index ? ColorHelper.primaryColor : ColorHelper.lightGreenColor,
            time: '${index + 1}.30',
            textColor: currentIndex == index ? Colors.white : Colors.black,
            isAm: false,
          ),
        ),
        itemCount: 8,
      ),
    );
  }
}
