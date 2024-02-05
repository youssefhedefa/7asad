import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorHelper.cardBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 2,
            offset: Offset(1, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 14.0,
              top: 26,
              bottom: 12,
            ),
            child: Text(
              '${ getDayOfWeek(today)} ,${DateFormat.MMMd('ar').format(today)}',
              style: TextStyleHelper.font22MediumDarkestGreen,
            ),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2022, 10, 16),
            lastDay: DateTime.utc(2040, 3, 14),
            focusedDay: today,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                today = selectedDay;
              });
            },
            selectedDayPredicate: (day) => isSameDay(day,today),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.5,
                    color: Color.fromRGBO(230, 224, 233, 1),
                  ),
                ),
              ),
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: const BoxDecoration(
                color: ColorHelper.primaryColor,
                shape: BoxShape.circle,
              ),
              isTodayHighlighted: true,
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorHelper.primaryColor),
              ),
              todayTextStyle: const TextStyle(color: ColorHelper.primaryColor),
              selectedTextStyle: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
