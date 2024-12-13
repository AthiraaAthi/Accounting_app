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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TableCalendar(
                availableCalendarFormats: {CalendarFormat.month: "Month"},
                calendarFormat: CalendarFormat.month,
                focusedDay: DateTime.now(),
                firstDay: DateTime(2000, 1, 1),
                lastDay: DateTime(2100, 12, 31)),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    foregroundColor: WidgetStatePropertyAll(white),
                    backgroundColor: WidgetStatePropertyAll(primaryColorBlue)),
                onPressed: () {},
                child: Text("Add Payment")),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                tileColor: Color.fromARGB(255, 182, 182, 186),
                leading: Text("Selected date Event"),
                trailing: Text("No Data"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("History"),
            SizedBox(
              height: 10,
            ),
            // Expanded(
            //     child: Container(
            //   height: 500,
            //   width: double.infinity,
            //   child: ListView.builder(
            //     itemCount: 3,
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) => ListTile(
            //       leading: Text("huu"),
            //     ),
            //   ),
            // ))
          ],
        ),
      ),
      bottomNavigationBar: Container(),
    );
  }
}
