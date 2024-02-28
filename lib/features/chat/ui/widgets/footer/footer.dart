//import 'dart:io';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/chat/ui/widgets/footer/attach_menu.dart';
import 'package:final_project/features/chat/ui/widgets/footer/attach_or_send_icon.dart';
import 'package:final_project/features/chat/ui/widgets/footer/custom_icons.dart';
import 'package:final_project/features/chat/ui/widgets/footer/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomFooter extends StatefulWidget {
  const CustomFooter({super.key});

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {


  final record = FlutterSoundRecorder();

  TextEditingController controller = TextEditingController();
  bool isMicAndCamera = true;
  bool isMicOpen = false;
  bool isPause = false;


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
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(top: 14, left: 14, bottom: 18),
      decoration: const BoxDecoration(
        color: ColorHelper.medGreenColor,
      ),
      child: isMicOpen ?
      Row(
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
      ) :
      Row(
        children: [
          const SizedBox(width: 6),
          isMicAndCamera
              ? MicAndCameraIcons(
            onMicTap: () async{
              setState(() {
                isMicOpen = true;
              });
              await record.openRecorder();
              await start();
              record.setSubscriptionDuration(const Duration(milliseconds: 5));
            },
          )
              : const AttachAndSendIcon(
                  isAttach: false,
                ),
          const SizedBox(width: 8),
          CustomTextField(
            controller: controller,
            onTap: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  isMicAndCamera = false;
                });
              } else {
                setState(() {
                  isMicAndCamera = true;
                });
              }
            },
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  isMicAndCamera = false;
                });
              } else {
                setState(() {
                  isMicAndCamera = true;
                });
              }
            },
          ),
          const SizedBox(width: 8),
          const AttachMenu(),
        ],
      ),
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


