import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendarWidget extends StatefulWidget {
  const MyCalendarWidget({super.key});

  @override
  State<MyCalendarWidget> createState() => _MyCalendarWidgetState();
}

class _MyCalendarWidgetState extends State<MyCalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
    );
  }
}