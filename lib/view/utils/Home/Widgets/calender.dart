import 'dart:developer';

import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({
    super.key,
  });

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  var selectedDate = DateTime.now();
  var focusdDate = DateTime.now();
  late Map<DateTime, List<String>> _events;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: ColorConstant.defBlue,
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorConstant.defBlue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: focusdDate,
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != focusdDate) {
      setState(() {
        focusdDate = pickedDate;
        selectedDate = pickedDate;
      });
    }
  }

  late String date;
  @override
  void initState() {
    super.initState();
    date = DateFormat.yMd().format(DateTime.now());
    _events = {
      DateTime(2024, 12, 2): ['Paid'], // Correct format
      DateTime(2024, 12, 9): ['Not Paid'], // Correct format
      DateTime(2024, 12, 16): ['Pending'], // Correct format
      DateTime(2024, 12, 23): ['Pending'], // Correct format
    };
  }

  Color _getEventColor(String event) {
    switch (event) {
      case 'Paid':
        return lightGreen;
      case 'Not Paid':
        return lightRed;
      case 'Pending':
        return orenge;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: CalendarStyle(
          cellMargin: EdgeInsets.all(2),
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: focusdDate != DateTime.now()
                ? primaryColorBlue.withOpacity(0.5)
                : primaryColorBlue,
          ),
          selectedDecoration: BoxDecoration(
            color: primaryColorBlue,
            shape: BoxShape.circle,
          ),
          markerSize: 0),
      rowHeight: 40,
      availableCalendarFormats: {CalendarFormat.month: "Month"},
      calendarFormat: CalendarFormat.month,
      focusedDay: focusdDate,
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      selectedDayPredicate: (day) {
        return isSameDay(selectedDate, day);
      },
      onPageChanged: (focusedDay) {
        setState(() {
          focusdDate = focusedDay;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        final events = _events[
            DateTime(selectedDay.year, selectedDay.month, selectedDay.day)];

        selectedDate = selectedDay;
        final moDate = DateFormat.yMd().format(selectedDate);
        if (selectedDay.isBefore(DateTime.now()) ||
            isSameDay(selectedDay, DateTime.now())) {
          setState(() {
            focusdDate = focusedDay;
            final day = moDate;
            date = day;
            final modifiedDate = DateFormat.yMd().format(selectedDay);
            date = modifiedDate;
            log(date);
          });
        } else if (events != null && events.contains('Pending')) {
          // Prevent any action for pending days
          return;
        }
      },
      enabledDayPredicate: (day) {
        final events = _events[DateTime(day.year, day.month, day.day)];
        if (events != null && events.contains('Pending')) {
          return true;
        }
        return day.isBefore(DateTime.now()) || isSameDay(day, DateTime.now());
      },
      onHeaderTapped: (focusedDay) {
        selectDate(context);
      },
      eventLoader: (day) {
        return _events[DateTime(day.year, day.month, day.day)] ?? [];
      },
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          final events = _events[DateTime(day.year, day.month, day.day)];
          if (events != null && events.isNotEmpty) {
            final eventType = events.first; // Get the first event
            return Container(
              margin: const EdgeInsets.all(4), // Cell margin
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getEventColor(eventType), // Event-specific color
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
