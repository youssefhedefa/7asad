import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/chat/data/models/messages.dart';
import 'package:final_project/features/chat/ui/widgets/audio_recorde/audio_player_message.dart';
import 'package:flutter/material.dart';

class MessageContents extends StatelessWidget {
  const MessageContents({
    super.key,
    required this.message,
    this.isMe,
  });

  final Message message;
  final bool? isMe;

  @override
  Widget build(BuildContext context) {
    if (message.messageType == 'text') {
      return  Text(
        message.message,
        textAlign: TextAlign.right,
        style: TextStyleHelper.font18MediumWhite,
      );
    } else if (message.messageType == 'image') {
      return Image.network(
        message.message,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      );
    }
    else if (message.messageType == 'audio') {
      return AudioPlayerMessage(
        message: message.message,
        isMe: isMe ?? true,
      );
    }
    return const SizedBox();
  }
}

// class AudioPlayerView extends StatefulWidget {
//   final String path;
//   final bool run;
//   const AudioPlayerView({super.key, required this.path, required this.run,});
//
//   @override
//   State<AudioPlayerView> createState() => _AudioPlayerViewState();
// }
//
// class _AudioPlayerViewState extends State<AudioPlayerView> {
//   late final Future loadAudio;
//   //double? sliderTempValue;
//   late AudioPlayer audioPlayer;
//   Duration? duration = Duration.zero;
//   Duration position = Duration.zero;
//   bool isPlaying = false;
//
//   @override
//   void initState() {
//     //loadAudio = audioPlayerController.loadAudio(widget.path);
//     audioPlayer = AudioPlayer();
//     loadAudio = audioPlayer.play(UrlSource(widget.path));
//     audioPlayer.pause();
//     audioDuration();
//
//     audioPlayer.onPlayerStateChanged.listen((event) {
//       setState(() {
//         isPlaying = event == PlayerState.playing;
//       });
//     });
//
//     audioPlayer.onDurationChanged.listen((event) {
//       setState(() {
//         duration = event;
//       });
//     });
//
//     audioPlayer.onPositionChanged.listen((event) {
//       setState(() {
//         position = event;
//       });
//     });
//     super.initState();
//   }
//
//   audioDuration() async {
//     //audioPlayer.setSourceUrl(widget.path);
//     duration = await audioPlayer.getDuration();
//     return duration;
//   }
//
//   @override
//   void dispose() {
//     //audioPlayerController.dispose();
//     audioPlayer.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: loadAudio,
//       builder: (context, snapshot) {
//         return StreamBuilder(
//           stream: audioPlayer.onPositionChanged,
//           builder: (context, snapshot) {
//             return Column(
//               children: [
//                 Slider(
//                   value: widget.run ? position.inSeconds.toDouble() : 0,
//                   min: 0,
//                   max: duration!.inSeconds.toDouble(),
//                   activeColor: Colors.white,
//                   onChanged: (double value) {
//                     position = Duration(seconds: value.toInt());
//                     setState(() {
//                       audioPlayer.seek(position);
//                     });
//                   },
//                   onChangeEnd: (double value) {
//                     position = Duration(seconds: value.toInt());
//                     setState(() {
//                       audioPlayer.seek(position);
//                       audioPlayer.resume();
//                     });
//                   },
//                   onChangeStart: (double value) {
//                     position = Duration(seconds: value.toInt());
//                     setState(() {
//                       audioPlayer.pause();
//                     });
//                   },
//                 ),
//                 Text(
//                   _formatToDateTime(
//                     position.inSeconds.toInt(),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     isPlaying = !isPlaying;
//                     setState(() {
//                     });
//                   },
//                   child: PlayPauseButton(
//                     isPlaying: isPlaying,
//                     onTap: () {
//                       if (isPlaying) {
//                         audioPlayer.pause();
//                       }else {
//                         audioPlayer.resume();
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
//
//   String _formatToDateTime(int durationInMill){
//     //2000 / (1000 * 60) = 00 minutes
//     final int minutes = durationInMill ~/ Duration.millisecondsPerMinute;
//
//     //(2000 % 60000) / 1000 = 02 sec
//     final int seconds = (durationInMill % Duration.millisecondsPerMinute) ~/ Duration.millisecondsPerSecond;
//
//     return '${minutes.toString().padLeft(2,'0')} : ${seconds.toString().padLeft(2,'0')}';
//   }
// }
//


