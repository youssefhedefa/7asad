import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final Function()? onTap;
  const PlayPauseButton(
      {super.key, required this.isPlaying, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 54,
        height: 54,
        padding: EdgeInsets.only(
          left: isPlaying ? 0 : 4,
        ),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow_sharp,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
