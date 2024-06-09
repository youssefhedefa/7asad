import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_floating_item.dart';
import 'package:final_project/features/scan/data/models/diseases_info.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_cubit.dart';
import 'package:final_project/features/scan/logic/prediction_cubit/prediction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<PredictionCubit>(),
      child: BlocConsumer<PredictionCubit, PredictionState>(
        builder: (context, state) {
          return SizedBox(
            height: 80,
            child: Column(
              children: [
                SpeedDial(
                  openCloseDial: ValueNotifier(true),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  overlayOpacity: 0,
                  overlayColor: Colors.transparent,
                  renderOverlay: false,
                  children: [
                    SpeedDialChild(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      onTap: () async {
                        await context
                            .read<PredictionCubit>()
                            .pickImagesFromGallery();
                        if (context.mounted) {
                          context.read<PredictionCubit>().predict(
                                context.read<PredictionCubit>().image!,
                              );
                        }
                      },
                      child: const CustomFloatingButton(
                        image: IconHelper.gallereyIcon,
                        borderColor: ColorHelper.primaryColor,
                        backGroundColor: ColorHelper.cardBackgroundColor,
                        ratio: 22,
                      ),
                    ),
                    SpeedDialChild(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      foregroundColor: Colors.transparent,
                      onTap: () async {
                        await context
                            .read<PredictionCubit>()
                            .pickImagesFromCamera();
                        if (context.mounted) {
                          context.read<PredictionCubit>().predict(
                                context.read<PredictionCubit>().image!,
                              );
                        }
                      },
                      child: const CustomFloatingButton(
                        image: IconHelper.cameraIcon,
                        borderColor: ColorHelper.primaryColor,
                        backGroundColor: ColorHelper.cardBackgroundColor,
                        ratio: 22,
                      ),
                    ),
                  ],
                  child: const CustomFloatingButton(
                    image: IconHelper.scanIcon,
                    borderColor: ColorHelper.primaryColor,
                    backGroundColor: ColorHelper.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'المسح الضوئي',
                  style: TextStyleHelper.font12RegularDarkGreen,
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is LoadingPredictionState) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is SuccessPrdeictionState) {
            Navigator.pop(context);
            DiseaseInfoModel diseaseInfo = context.read<PredictionCubit>().diseaseModel;
            Navigator.pushNamed(context, RoutesManager.diseaseDetectionScreen,
                arguments: diseaseInfo);
          }
        },
      ),
    );
  }
}
