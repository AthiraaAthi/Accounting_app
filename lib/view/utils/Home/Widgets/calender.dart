import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        availableCalendarFormats: {CalendarFormat.month: "Month"},
        calendarFormat: CalendarFormat.month,
        focusedDay: DateTime.now(),
        firstDay: DateTime(2000, 1, 1),
        lastDay: DateTime(2100, 12, 31));
  }
}
