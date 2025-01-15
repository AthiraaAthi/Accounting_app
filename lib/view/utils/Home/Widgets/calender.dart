import 'dart:developer';

import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';

import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatefulWidget {
  final LendingModel state;
  const CalenderWidget({
    super.key,
    required this.state,
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

  // Color _getEventColor(String event) {
  //   switch (event) {
  //     case 'Paid':
  //       return lightGreen;
  //     case 'Not Paid':
  //       return lightRed;
  //     case 'Pending':
  //       return orenge;
  //     default:
  //       return Colors.grey;
  //   }
  // }

  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
    final dateTimeList =
        widget.state.listOfTImestamp!.map((e) => e.toDate()).toList();

    log(dateTimeList.toString());
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
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2100, 12, 31),
      selectedDayPredicate: (day) {
        return isSameDay(selectedDate, day);
      },
      onPageChanged: (focusedDay) {
        setState(() {
          focusdDate = focusedDay;
        });
      },
      // onDaySelected: (selectedDay, focusedDay) {
      //   final events = _events[
      //       DateTime(selectedDay.year, selectedDay.month, selectedDay.day)];

      //   selectedDate = selectedDay;
      //   final moDate = DateFormat.yMd().format(selectedDate);
      //   if (selectedDay.isBefore(DateTime.now()) ||
      //       isSameDay(selectedDay, DateTime.now())) {
      //     setState(() {
      //       focusdDate = focusedDay;
      //       final day = moDate;
      //       date = day;
      //       final modifiedDate = DateFormat.yMd().format(selectedDay);
      //       date = modifiedDate;
      //       log(date);
      //     });
      //   } else if (events != null && events.contains('Pending')) {
      //     // Prevent any action for pending days
      //     return;
      //   }
      // },
      // enabledDayPredicate: (day) {

      // },
      onHeaderTapped: (focusedDay) {
        selectDate(context);
      },
      eventLoader: (day) {
        // Check if the normalized day has any events
        return dateTimeList.where((event) => isSameDay(event, day)).toList();
      },
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          // Highlight days with events
          if (dateTimeList.map(normalizeDate).contains(normalizeDate(day))) {
            return Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange, // Event-specific color
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }
          return null; // Use default rendering for other dates
        },
      ),
    );
  }
}
