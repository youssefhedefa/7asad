import 'package:audioplayers/audioplayers.dart';
import 'package:final_project/features/chat/ui/widgets/audio_recorde/play_pause_button.dart';
import 'package:flutter/material.dart';

class AudioPlayerMessage extends StatefulWidget {
  const AudioPlayerMessage({super.key, required this.message, required this.isMe});

  final String message;
  final bool isMe;

  @override
  State<AudioPlayerMessage> createState() => _AudioPlayerMessageState();
}

class _AudioPlayerMessageState extends State<AudioPlayerMessage> {

  final player = AudioPlayer();
  bool isPlaying = false;
  double sliderValue = 0.0;
  double? maxDuration = 1.0;

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    player.onPlayerComplete.listen((event) {
      setState(() {
        sliderValue = 0.0;
        player.stop();
        player.seek(const Duration(milliseconds: 0));
        isPlaying = false;
      });
    });
    player.onPlayerStateChanged.listen((event) {
      if(event == PlayerState.completed){
        setState(() {
          sliderValue = 0.0;
          player.seek(const Duration(milliseconds: 0));
          isPlaying = false;
        });
      }
    });
    super.initState();
  }


  Future<void> playFormUrl() async {
    await player.play(UrlSource(widget.message));
    maxDuration = await player.getDuration().then((value) {
      return value!.inMilliseconds.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.isMe ? TextDirection.rtl : TextDirection.ltr,
      child: Row(
        children: [
          PlayPauseButton(
            isPlaying: isPlaying,
            onTap: () {
              if(isPlaying == false && sliderValue == 0.0){
                playFormUrl();
                setState(() {
                  isPlaying = !isPlaying;
                });
              }
              else if (isPlaying == false && sliderValue != 0.0){
                player.seek(Duration(milliseconds: sliderValue.toInt()));
                player.resume();
                setState(() {
                  isPlaying = !isPlaying;
                });
              }
              else{
                player.pause();
                setState(() {
                  isPlaying = !isPlaying;
                });
              }
            },
          ),
          StreamBuilder<Duration>(
            stream: player.onPositionChanged,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                sliderValue = (snapshot.data!.inMilliseconds.toDouble()).clamp(0.0, maxDuration?? 1.0);
                print(' value : $sliderValue maxDuration: $maxDuration');
              }
              return Slider(
                value: sliderValue,
                min: 0.0,
                max: maxDuration ?? 1.0,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                    player.seek(Duration(milliseconds: value.toInt()));
                  });
                  if(value == maxDuration){
                    //isPlaying = false;
                    setState(() {
                      sliderValue = 0.0;
                      player.seek(const Duration(milliseconds: 0));
                      isPlaying = false;
                    });
                  }
                },
                onChangeStart: (value) {
                  print('start $value');
                  isPlaying = false;
                  setState(() {
                    player.pause();
                  });
                },
                onChangeEnd: (value) {
                  isPlaying = true;
                  print('start $value');
                  sliderValue = value;
                  setState(() {
                    player.seek(Duration(milliseconds: value.toInt()));
                    player.resume();
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
