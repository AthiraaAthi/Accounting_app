import 'package:curved_nav/view/utils/Home/selection_card/history_screen.dart';
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
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          trailing: CircleAvatar(
                            radius: 10,
                            backgroundColor: lightRed,
                          ),
                          title: Text("Added amount"),
                        ),
                        ListTile(
                          trailing: CircleAvatar(
                            radius: 10,
                            backgroundColor: lightGreen,
                          ),
                          title: Text("Paid"),
                        ),
                        ListTile(
                          trailing: CircleAvatar(
                            radius: 10,
                            backgroundColor: orenge,
                          ),
                          title: Text("Pending"),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(Icons.info_outline)),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'Add Amount',
                  child: Text('Add Amount'),
                ),
                PopupMenuItem(
                  value: 'Delete Account',
                  child: Text('Delete Account'),
                ),
                PopupMenuItem(
                  value: 'Share',
                  child: Text('Share'),
                ),
                PopupMenuItem(
                  value: 'Help',
                  child: Text('Help'),
                ),
              ];
            },
          ),
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Amount"), Text("10000/-")],
                  ),
                ),
                Text("Weekly Pay")
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: white,
            child: TableCalendar(
                availableCalendarFormats: {CalendarFormat.month: "Month"},
                calendarFormat: CalendarFormat.month,
                focusedDay: DateTime.now(),
                firstDay: DateTime(2000, 1, 1),
                lastDay: DateTime(2100, 12, 31)),
          ),
          Container(
            height: 20,
            color: white,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  foregroundColor: WidgetStatePropertyAll(white),
                  backgroundColor: WidgetStatePropertyAll(primaryColorBlue)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(),
                );
              },
              child: Text("Add Payment")),
          Container(
            height: 10,
            color: white,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                tileColor: Color.fromARGB(255, 182, 182, 186),
                leading: Text("Selected date Event"),
                trailing: Text("No Data"),
              ),
            ),
          ),
          Container(
            height: 10,
            color: white,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryScreen(),
                  ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              color: white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("History"), Icon(Icons.keyboard_arrow_right)],
              ),
            ),
          ),
          Container(
            height: 10,
            color: white,
          ),
          Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: lightGreen,
                      leading: Text('01/01/2000---${index + 1}'),
                      trailing: Text('-2000/-'),
                    ),
                  );
                },
              )),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColorBlue,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Balance amount:',
                      style: TextStyle(color: white),
                    ),
                    Text(
                      "4000\\-",
                      style: TextStyle(color: white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
