import 'package:final_project/core/widgets/buttom_navigation_bar.dart';
import 'package:final_project/core/widgets/custom_floating_action_button.dart';
import 'package:final_project/features/home/logic/manager/change_screen_cubit.dart';
import 'package:final_project/features/home/logic/manager/change_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandScreen extends StatelessWidget {
  const LandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChangeScreenCubit(),
      child: BlocBuilder<ChangeScreenCubit,ChangeScreenStates>(
        builder: (BuildContext context, state) {
          var changeScreenCubit = BlocProvider.of<ChangeScreenCubit>(context);
          return Scaffold(
            floatingActionButton: const CustomFloatingActionButton(),
            //floatingActionButton: const TestButton(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomBottomNavigationBar(changeScreenCubit: changeScreenCubit,),
            body: changeScreenCubit.getView(),
          );
        },
      ),
    );
  }
}
