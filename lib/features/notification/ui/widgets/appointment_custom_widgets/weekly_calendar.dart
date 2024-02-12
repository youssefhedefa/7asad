import 'dart:collection';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({super.key});

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  DateTime today = DateTime.now();

  //Map<DateTime, List> _eventsList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  final Map<DateTime, List> _eventsList = {
    DateTime.now().subtract(const Duration(days: 2)): ['Event A1', 'Event B1'],
    DateTime.now(): ['Event A2', 'Event B2',],
    DateTime.now().add(const Duration(days: 1)): [
      'Event A3',
      'Event B3',
    ],
    DateTime.now().add(const Duration(days: 3)):
        {'Event A4', 'Event A5', 'Event B4'}.toList(),
    DateTime.now().add(const Duration(days: 7)): ['Event A6', 'Event B5', 'Event C3'],
  };


  @override
  Widget build(BuildContext context) {

    final events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEventForDay(DateTime day) {
      return events[day] ?? [];
    }

    return TableCalendar(
      focusedDay: today.add(const Duration(days: 1)),
      firstDay: DateTime.utc(2022, 10, 10),
      lastDay: DateTime.utc(2042, 10, 10),
      calendarFormat: CalendarFormat.week,
      eventLoader: getEventForDay,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          today = selectedDay;
        });
      },
      selectedDayPredicate: (day) => isSameDay(day, today),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      calendarStyle: CalendarStyle(
        markerDecoration: const BoxDecoration(
          color: ColorHelper.discTextColor,
          shape: BoxShape.circle,
        ),
        markerMargin: const EdgeInsets.all(1),
        selectedDecoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: ColorHelper.primaryColor),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(1, 3),
              spreadRadius: 0,
            )
          ],
        ),
        isTodayHighlighted: true,
        todayDecoration: const BoxDecoration(
          color: ColorHelper.primaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(1, 3),
              spreadRadius: 0,
            )
          ],
        ),
        todayTextStyle: TextStyleHelper.font18MediumWhite,
        selectedTextStyle:
            TextStyleHelper.font18MediumWhite.copyWith(color: Colors.black),
        defaultTextStyle:
            TextStyleHelper.font18MediumWhite.copyWith(color: Colors.black),
        outsideTextStyle:
            TextStyleHelper.font18MediumWhite.copyWith(color: Colors.black),
        weekendTextStyle:
            TextStyleHelper.font18MediumWhite.copyWith(color: Colors.black),
      ),
    );
  }
}
