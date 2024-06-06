import 'dart:io';

import 'package:final_project/features/chat/data/repo/chat_repo.dart';
import 'package:final_project/features/chat/logic/controller/audio_recorder/audio_recorder_controller.dart';
import 'package:final_project/features/chat/ui/widgets/audio_recorde/audio_waves.dart';
import 'package:final_project/features/chat/ui/widgets/audio_recorde/play_pause_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record/record.dart';

class AudioRecorderViewBody extends StatefulWidget {
  const AudioRecorderViewBody({super.key, required this.onGestureTap});
  final Function onGestureTap;

  @override
  State<AudioRecorderViewBody> createState() => _AudioRecorderViewBodyState();
}

class _AudioRecorderViewBodyState extends State<AudioRecorderViewBody> {
  late final AudioRecorderController audioRecorderService;
  late final ChatRepository chatRepository;

  @override
  void initState() {
    audioRecorderService = context.read<AudioRecorderController>();
    audioRecorderService.start();
    chatRepository = ChatRepository();
    super.initState();
  }

  @override
  void dispose() {
    audioRecorderService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          const AudioWavesView(),
          const SizedBox(height: 16),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              GestureDetector(
                onTap: () async {
                  context
                      .read<AudioRecorderController>()
                      .stop((voiceNoteModel) async {
                    context
                        .read<AudioRecorderController>()
                        .loadAudio(voiceNoteModel!.path);
                    final File file = await context
                        .read<AudioRecorderController>()
                        .getAudioFilePath(voiceNoteModel.path);
                    chatRepository.sendFileMessage(
                      file: file,
                      chatroomId: '94204a30-0981-11ef-b9f0-c98437472eca',
                      receiverId: '6625feb2629a73b4555a0de2',
                      messageType: 'audio',
                    );
                    widget.onGestureTap();
                  });
                },
                child: const SizedBox(
                  width: 34,
                  height: 34,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              const Spacer(),
              StreamBuilder(
                stream: audioRecorderService.recordStateStream,
                builder: (context, snapshot) {
                  return PlayPauseButton(
                    isPlaying: snapshot.data == RecordState.record,
                    onTap: () {
                      if (snapshot.data == RecordState.pause) {
                        audioRecorderService.resume();
                      } else {
                        audioRecorderService.pause();
                      }
                    },
                  );
                },
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context
                      .read<AudioRecorderController>()
                      .stop((voiceNoteModel) {
                    if (voiceNoteModel == null) {
                      Navigator.pop(context);
                    } else {
                      context
                          .read<AudioRecorderController>()
                          .delete(voiceNoteModel.path)
                          .then((value) {});
                    }
                  });
                  widget.onGestureTap();
                },
                child: const SizedBox(
                  width: 34,
                  height: 34,
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
