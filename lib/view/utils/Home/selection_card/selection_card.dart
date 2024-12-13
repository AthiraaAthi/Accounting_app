import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.info_outline)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
              ))
        ],
        surfaceTintColor: primaryColorBlue,
        foregroundColor: white,
        title: Text("Person Name"),
        backgroundColor: ColorConstant.defBlue,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Container(
            decoration: BoxDecoration(color: white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Amount"), Text("10000/-")],
                ),
                Text("Weekly Pay")
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
              availableCalendarFormats: {CalendarFormat.month: "Month"},
              calendarFormat: CalendarFormat.month,
              focusedDay: DateTime.now(),
              firstDay: DateTime(2000, 1, 1),
              lastDay: DateTime(2100, 12, 31))
        ],
      ),
    );
  }
}
