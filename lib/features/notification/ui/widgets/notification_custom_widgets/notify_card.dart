import 'package:final_project/core/constants.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/notification/data/notify_model.dart';
import 'package:flutter/material.dart';

class NotifyCard extends StatelessWidget {
  const NotifyCard({super.key, this.isClicked = false, required this.type, this.personName, this.reminderTime, this.bookTime, this.goToChat, this.onTap});

  final bool? isClicked;
  final void Function()? onTap;
  final String type;

  final String? personName;
  final String? reminderTime;
  final String? bookTime;
  final void Function()? goToChat;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 24),
        decoration: BoxDecoration(
          color: isClicked! ? Colors.transparent : ColorHelper.notSelectedColor,
          border: const Border(
            top: BorderSide(color: Color(0xffCFD9D8), width: 1),
            bottom: BorderSide(color: Color(0xffCFD9D8), width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                notifyIconAndText().icon,
                const SizedBox(width: 6),
                Text(
                  notifyIconAndText().type,
                  style: TextStyleHelper.font16BoldDarkestGreen,
                ),
                const Spacer(),
                Text(
                  'منذ 18 دقيقة',
                  style: TextStyleHelper.font12RegularDarkGreen,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: notifyIconAndText(
                personName: personName,
                reminderTime: reminderTime,
                bookTime: bookTime,
                goToChat: goToChat,
              ).notifyContent,
            ),
          ],
        ),
      ),
    );
  }

  NotifyModel notifyIconAndText({
    String? personName,
    String? reminderTime,
    String? bookTime,
    void Function()? goToChat,
  }) {
    if (type == Constants.reminderType) {
      return NotifyModel(
        type: type,
        notifyContent: RichText(
          text: TextSpan(
            text: 'لديك موعد مع',
            style: TextStyleHelper.font16RegularDarkestGreen,
            children: [
              TextSpan(
                text: ' $personName ',
                style: TextStyleHelper.font16MediumDarkGreen,
              ),
              TextSpan(
                text: 'اليوم الساعه',
                style: TextStyleHelper.font16RegularDarkestGreen,
              ),
              TextSpan(
                text: '  $reminderTime',
                style: TextStyleHelper.font16MediumDarkGreen
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
        icon: const Icon(
          Icons.schedule_outlined,
          color: ColorHelper.discTextColor,
        ),
      );
    }
    else if (type == Constants.alertType) {
      return NotifyModel(
        type: type,
        notifyContent: RichText(
          text: TextSpan(
            text: 'لديك موعد مع',
            style: TextStyleHelper.font16RegularDarkestGreen,
            children: [
              TextSpan(
                text: ' $personName ',
                style: TextStyleHelper.font16MediumDarkGreen,
              ),
              TextSpan(
                text: 'اليوم الساعه',
                style: TextStyleHelper.font16RegularDarkestGreen,
              ),
              TextSpan(
                text: '  $reminderTime',
                style: TextStyleHelper.font16MediumDarkGreen
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
        icon: const Icon(
          Icons.warning_amber,
          color: ColorHelper.discTextColor,
        ),
      );
    }
    else if (type == Constants.streamType) {
      return NotifyModel(
        type: type,
        notifyContent: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'الان بدا معادك مع $personName ',
              style: TextStyleHelper.font16RegularDarkestGreen,
            ),
            InkWell(
              onTap: goToChat,
              child: Text(
                'دوس هنا للانتقال للمحادثه',
                style: TextStyleHelper.font16RegularDarkestGreen.copyWith(color: ColorHelper.primaryColor),
              ),
            ),
          ],
        ),
        icon: const Icon(
          Icons.podcasts_outlined,
          color: ColorHelper.errorColor,
        ),
      );
    }
    else if (type == Constants.cancelBookingType) {
      return NotifyModel(
        type: type,
        notifyContent: RichText(
          text: TextSpan(
            text: 'تم الغاء معادك مع',
            style: TextStyleHelper.font16RegularDarkestGreen,
            children: [
              TextSpan(
                text: ' $personName ',
                style: TextStyleHelper.font16MediumDarkGreen,
              ),
              TextSpan(
                text: 'يوم $bookTime الساعه',
                style: TextStyleHelper.font16RegularDarkestGreen,
              ),
              TextSpan(
                text: '  $reminderTime',
                style: TextStyleHelper.font16MediumDarkGreen
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
        icon: const Icon(
          Icons.cancel_outlined,
          color: ColorHelper.errorColor,
        ),
      );
    }
    else if (type == Constants.confirmBookingType) {
      return NotifyModel(
        type: type,
        notifyContent: RichText(
          text: TextSpan(
            text: 'تم تاكيد معادك مع',
            style: TextStyleHelper.font16RegularDarkestGreen,
            children: [
              TextSpan(
                text: ' $personName ',
                style: TextStyleHelper.font16MediumDarkGreen,
              ),
              TextSpan(
                text: 'يوم $bookTime الساعه',
                style: TextStyleHelper.font16RegularDarkestGreen,
              ),
              TextSpan(
                text: '  $reminderTime',
                style: TextStyleHelper.font16MediumDarkGreen
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
        icon: const Icon(
          Icons.check_circle_outline,
          color: ColorHelper.successfulColor,
        ),
      );
    }
    return NotifyModel(
      type: type,
      icon: const SizedBox(),
    );
  }
}
