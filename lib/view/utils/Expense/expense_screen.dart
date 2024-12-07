import 'package:curved_nav/view/utils/Expense/expense_add_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen>
    with SingleTickerProviderStateMixin {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: ColorConstant.defBlue,
        title: const Text(
          "Track Your Expense here",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExpenseScreen(),
                    ));
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: CalendarFormat.week,
            availableCalendarFormats: {CalendarFormat.week: 'weeks'},
            calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                    color: primaryColorBlue, shape: BoxShape.circle)),
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
          )
        ],
      ),
    );
  }
}
