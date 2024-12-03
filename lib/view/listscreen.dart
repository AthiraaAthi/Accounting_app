import 'package:curved_nav/view/utils/color_constant/color_constant.dart';

import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            HorizontalWeekCalendar(
              minDate: DateTime(2020, 1, 31),
              maxDate: DateTime(2024, 12, 31),
              initialDate: DateTime.now(),
              onDateChange: (date) {
                setState(
                  () {
                    selectedDate = date;
                  },
                );
              },
              showTopNavbar: true,
              monthFormat: "MMMM yyyy",
              showNavigationButtons: false,
              weekStartFrom: WeekStartFrom.Monday,
              borderRadius: BorderRadius.circular(7),
              activeBackgroundColor: primaryColorBlue,
              activeTextColor: Colors.white,
              inactiveBackgroundColor: primaryColorBlue.withOpacity(.3),
              inactiveTextColor: Colors.white,
              disabledTextColor: Colors.grey,
              disabledBackgroundColor: Colors.grey.withOpacity(.3),
              activeNavigatorColor: primaryColorBlue,
              inactiveNavigatorColor: Colors.grey,
              monthColor: primaryColorBlue,
            ),
          ],
        ),
      ),
    );
  }
}
