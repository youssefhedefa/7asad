import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';


class ZepaletElFooter extends StatefulWidget {
  const ZepaletElFooter({super.key});

  @override
  State<ZepaletElFooter> createState() => _ZepaletElFooterState();
}

class _ZepaletElFooterState extends State<ZepaletElFooter> {

  bool isMicAndCamera = true;
  bool isMicOpen = false;
  bool isPause = false;
  final record = FlutterSoundRecorder();


  @override
  void initState() {
    super.initState();
    initRecord();
  }

  @override
  void dispose() {
    record.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap:() async {
            if(record.isRecording){
              await stop();
            }
            else{
              await start();
            }
          },
          child: const SizedBox(
            width: 34,
            height: 34,
            child: Icon(
              Icons.keyboard_voice_outlined,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          children: [
            StreamBuilder<RecordingDisposition>(
                stream: record.onProgress,
                builder: (_,snapshot){
                  final duration = snapshot.hasData ?
                  snapshot.data!.duration : Duration.zero;

                  String twoDigit(int n) => n.toString().padLeft(2,'0');
                  final twoDigitInMinutes = twoDigit(duration.inMinutes.remainder(60));
                  final twoDigitInSecond = twoDigit(duration.inSeconds.remainder(60));

                  return Text(
                    ' $twoDigitInSecond : $twoDigitInMinutes ',
                    style: TextStyleHelper.font18MediumWhite,
                  );
                }
            ),
            const SizedBox(width: 6,),
            InkWell(
              onTap:() async {
                if(isPause){
                  await play();
                }
                else{
                  await pause();
                }
                setState(() {
                  isPause = !isPause;
                });
              },
              child: SizedBox(
                width: 34,
                height: 34,
                child: isPause ?
                const Icon(
                  Icons.pause,
                  color: Colors.white,
                ) :
                const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap:() async {
            await delete();
            setState(() {
              isMicOpen = false;
            });
          },
          child: const SizedBox(
            width: 34,
            height: 34,
            child: Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Future stop() async{
    await record.stopRecorder();
    //final path = await record.stopRecorder();
    //final audioFile = File(path!);
    //print('path audio '+audioFile.path);
    setState(() {
      isMicOpen = false;
    });
  }

  Future pause() async{
    await record.pauseRecorder();
  }

  Future play({int? duration}) async{
    await record.resumeRecorder();
  }

  Future delete() async{
    await record.deleteRecord(fileName: 'audio');
  }

  Future start() async{
    await record.startRecorder(toFile: 'audio');
  }

  Future initRecord() async{
    final state = await Permission.microphone.request();

    if(state != PermissionStatus.granted){
      throw 'Permission not granted';
    }
  }

}

//--------------------------------- add product -----------------------------
// import 'package:final_project/core/di/dependency_injection.dart';
// import 'package:final_project/core/theming/color_helper.dart';
// import 'package:final_project/core/theming/text_style_helper.dart';
// import 'package:final_project/core/widgets/custom_app_bar.dart';
// import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
// import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
// import 'package:final_project/features/market/ui/add_product_screen/widget/add_item_image.dart';
// import 'package:final_project/features/market/ui/add_product_screen/widget/item_info.dart';
// import 'package:final_project/features/market/ui/add_product_screen/widget/item_type_list.dart';
// import 'package:final_project/core/widgets/action_buttons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddProductScreen extends StatelessWidget {
//   const AddProductScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: getIt<ProductCubit>(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: const CustomAppBar(
//           title: 'بيع منتجك',
//           hasLeading: true,
//           background: Colors.white,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 32.0,
//                   bottom: 8,
//                   left: 16,
//                   right: 16,
//                 ),
//                 child: Text(
//                   'نوع المنتج',
//                   style: TextStyleHelper.font16BoldDarkestGreen,
//                 ),
//               ),
//               const ItemTypeList(),
//               const SizedBox(height: 12),
//               ItemInfo(
//                 label: 'اسم المنتج',
//                 isMultiLine: true,
//                 height: 40,
//                 controller: context.read<ProductCubit>().productNameController,
//               ),
//               ItemInfo(
//                 label: 'المكان',
//                 isMultiLine: true,
//                 height: 40,
//                 controller: context.read<ProductCubit>().productLocationController,
//
//               ),
//               ItemInfo(
//                 label: 'الوصف',
//                 isMultiLine: true,
//                 height: 40,
//                 controller: context.read<ProductCubit>().productDescriptionController,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: ItemInfo(
//                       label: 'سعر الواحد',
//                       height: 40,
//                       keyBordTyp: const TextInputType.numberWithOptions(
//                           decimal: true
//                       ),
//                       isMultiLine: false,
//                       controller: context.read<ProductCubit>().productPriceController,
//                     ),
//                   ),
//                   const Expanded(
//                       flex: 1,
//                       child: SizedBox(
//                           width: 0
//                       )),
//                   Expanded(
//                     flex: 5,
//                     child: ItemInfo(
//                       label: 'الكميه',
//                       height: 40,
//                       keyBordTyp: const TextInputType.numberWithOptions(
//                           decimal: true
//                       ),
//                       isMultiLine: false,
//                       controller: context.read<ProductCubit>().productAmountController,
//                     ),
//                   ),
//                   // Expanded(
//                   //   flex: 5,
//                   //   child: ItemInfo(
//                   //     label: 'العملة',
//                   //     height: 40,
//                   //     isMultiLine: false,
//                   //   ),
//                   // ),
//                 ],
//               ),
//               // const Row(
//               //   children: [
//               //     Expanded(
//               //       flex: 5,
//               //       child: ItemInfo(
//               //         label: 'الكميه',
//               //         height: 40,
//               //         keyBordTyp: TextInputType.numberWithOptions(
//               //             decimal: true
//               //         ),
//               //         isMultiLine: false,
//               //       ),
//               //     ),
//               //     Expanded(
//               //         flex: 1,
//               //         child: SizedBox(
//               //           width: 0
//               //         )),
//               //     Expanded(
//               //       flex: 5,
//               //       child: ItemInfo(
//               //         label: 'وحدة القياس',
//               //         height: 40,
//               //         // keyBordTyp: TextInputType.numberWithOptions(
//               //         //     decimal: true
//               //         // ),
//               //         isMultiLine: false,
//               //       ),
//               //     ),
//               //   ],
//               // ),
//               // const Row(
//               //   children: [
//               //     Expanded(
//               //       flex: 5,
//               //       child: ItemInfo(
//               //         label: 'الخصم ان وجد',
//               //         height: 40,
//               //         keyBordTyp: TextInputType.numberWithOptions(
//               //             decimal: true
//               //         ),
//               //         isMultiLine: false,
//               //       ),
//               //     ),
//               //     Expanded(
//               //         flex: 1,
//               //         child: SizedBox(
//               //           width: 0
//               //         )),
//               //     Expanded(
//               //       flex: 5,
//               //       child: ItemInfo(
//               //         label: 'السعر بعد الخصم',
//               //         height: 40,
//               //         keyBordTyp: TextInputType.numberWithOptions(
//               //             decimal: true
//               //         ),
//               //         isMultiLine: false,
//               //       ),
//               //     ),
//               //   ],
//               // ),
//               const AddItemImage(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 16.0,
//                     vertical: 20
//                 ),
//                 child: ActionButton(
//                   onTap: () {},
//                   label: 'نشر الأن',
//                   outerColor: ColorHelper.primaryColor,
//                   labelColor: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
