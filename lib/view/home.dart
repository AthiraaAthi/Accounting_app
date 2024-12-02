import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.defBlue,
        title: Text(
          "App Name",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _showdialogFunction(context);
              },
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }

  _showdialogFunction(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Container(
            height: 600,
            width: 600,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Text("Add New Card"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Money Lender",
                      ),
                      Switch(
                        activeColor: ColorConstant.defBlue,
                        value: true,
                        thumbColor: WidgetStatePropertyAll(Colors.white),
                        inactiveThumbColor: ColorConstant.defBlue,
                        focusColor: ColorConstant.defBlue,
                        trackColor: WidgetStatePropertyAll(
                          ColorConstant.defBlue,
                        ),
                        onChanged: (value) {},
                      ),
                      Text(
                        "To Give",
                      ),
                    ],
                  ),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.blue,
                    indicatorWeight: 2.0,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "Create"),
                      Tab(text: "Join"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      Column(
                        children: [
                          Container(
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Name",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
//  content: SizedBox(
//             width: double.maxFinite,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Toggle Switch
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "Money Lender",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Switch(
//                       value: false,
//                       onChanged: (value) {},
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),

//                 // Input Fields
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: "Name",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: "Phone (Optional)",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: "Description (Optional)",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: "Amount (With interest if any)",
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: "Installment Amount",
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 const SizedBox(height: 10),
//                 DropdownButtonFormField<String>(
//                   decoration: InputDecoration(
//                     labelText: "Installment Type",
//                     border: OutlineInputBorder(),
//                   ),
//                   items: const [
//                     DropdownMenuItem(
//                       value: "Monthly",
//                       child: Text("Monthly"),
//                     ),
//                     DropdownMenuItem(
//                       value: "Weekly",
//                       child: Text("Weekly"),
//                     ),
//                   ],
//                   onChanged: (value) {},
//                 ),
//                 const SizedBox(height: 20),

//                 // Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text("Cancel"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Add your create action here
//                       },
//                       child: const Text("Create"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),