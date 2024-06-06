import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/triangle_painter.dart';
import 'package:final_project/features/chat/data/models/messages.dart';
import 'package:final_project/features/chat/ui/widgets/message_content.dart';
import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({super.key, required this.message, this.isMe});

  final Message message;
  final bool? isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 8),
            constraints: BoxConstraints(
              minWidth: 1,
              maxWidth: MediaQuery.sizeOf(context).width * 0.8,
            ),
            decoration: const BoxDecoration(
              color: ColorHelper.darkGreenColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(21),
                topRight: Radius.circular(21),
                topLeft: Radius.circular(21),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                MessageContents(
                    message: message,
                    isMe: isMe,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0,left: 6),
                      child: Text(
                        '${message.timestamp.hour}:${message.timestamp.minute}',
                        style: TextStyleHelper.font14RegularDarkGreen.copyWith(
                          fontWeight: FontWeightHelper.medium,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Icon(
                      message.seen ?  Icons.done_all : Icons.done,
                      color: ColorHelper.successfulColor,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Transform.rotate(
              angle: 3.5 * (22/7),
              alignment: Alignment.bottomRight,
              transformHitTests: false,
              child: CustomPaint(
                painter: TrianglePainter(
                  color: ColorHelper.darkGreenColor
                ),
                size: const Size(10, 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
