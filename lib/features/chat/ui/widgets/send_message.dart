import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/triangle_painter.dart';
import 'package:final_project/features/chat/data/models/messages.dart';
import 'package:final_project/features/chat/ui/widgets/message_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SentMessage extends ConsumerWidget  {
  const SentMessage({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      constraints: BoxConstraints(
        minWidth: 1,
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPaint(
            painter: TrianglePainter(
                color: ColorHelper.primaryColor
            ),
            size: const Size(10, 12),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 1,
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 8),
              decoration: const BoxDecoration(
                color: ColorHelper.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                  topLeft: Radius.circular(21),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   message.message,
                  //   style: TextStyleHelper.font18MediumWhite,
                  // ),
                  MessageContents(message: message),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        message.seen ?  Icons.done_all : Icons.done,
                        color: ColorHelper.successfulColor,
                        size: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0,right: 6),
                        child: Text(
                          '${message.timestamp.hour}:${message.timestamp.minute}',
                          style: TextStyleHelper.font14RegularDarkGreen.copyWith(
                            fontWeight: FontWeightHelper.medium,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
