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
          )),
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
        }
      },
      enabledDayPredicate: (day) {
        return day.isBefore(DateTime.now()) || isSameDay(day, DateTime.now());
      },
      onHeaderTapped: (focusedDay) {
        selectDate(context);
      },
      eventLoader: (day) {
        return [];
      },
      // calendarBuilders: CalendarBuilders(markerBuilder: (context, day, events) {

      // },
      // ),
    );
  }
}
