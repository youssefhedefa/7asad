import 'package:final_project/core/constants.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_cubit.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_state.dart';
import 'package:final_project/features/scan/ui/widgets/appointment/consultants_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultantList extends StatefulWidget {
  const ConsultantList({super.key});

  @override
  State<ConsultantList> createState() => _ConsultantListState();
}

class _ConsultantListState extends State<ConsultantList> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<PredictionCubit>().getAllConsultants();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PredictionCubit,PredictionState>(
      builder: (context,state) {
        if( state is LoadingConsultantsState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: 150,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                  context.read<PredictionCubit>().consultantId = context.read<PredictionCubit>().consultants[index].id ?? '';
                },
                child: ConsultantsItem(
                  selected: currentIndex == index,
                  name: context.read<PredictionCubit>().consultants[index].name ?? '',
                  image: context.read<PredictionCubit>().consultants[index].photo ?? Constants.imageStatic,
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 26,
            ),
            itemCount: context.read<PredictionCubit>().consultants.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      }
    );
  }
}
