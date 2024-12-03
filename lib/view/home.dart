import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

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
    bool isMoneyLender = true;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Container(
            height: 550,
            width: 600,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Text("Add New Card"),
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
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Money Lender",
                                ),
                                Switch(
                                  activeColor: ColorConstant.defBlue,
                                  value: true,
                                  thumbColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  inactiveThumbColor: ColorConstant.defBlue,
                                  focusColor: ColorConstant.defBlue,
                                  trackColor: WidgetStatePropertyAll(
                                    ColorConstant.defBlue,
                                  ),
                                  onChanged: (value) {
                                    isMoneyLender = !isMoneyLender;
                                  },
                                ),
                                Text(
                                  "To Give",
                                ),
                              ],
                            ),
                            Container(
                              height: 35,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  labelStyle: TextStyle(fontSize: 15),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              height: 35,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Phone (Optional)",
                                  labelStyle: TextStyle(fontSize: 15),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextField(
                              maxLines: 4,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 50, top: 30),
                                border: OutlineInputBorder(),
                                labelText: "Description (Optional)",
                                hintStyle: TextStyle(fontSize: 15),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              height: 35,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Amount (With interest if any)",
                                  labelStyle: TextStyle(fontSize: 15),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              height: 35,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Installment Amount",
                                  labelStyle: TextStyle(fontSize: 15),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(height: 15),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: "Installment Type",
                                labelStyle: TextStyle(fontSize: 15),
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: "Monthly",
                                  child: Text("Monthly"),
                                ),
                                DropdownMenuItem(
                                  value: "Weekly",
                                  child: Text("Weekly"),
                                ),
                              ],
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Create",
                                    style: TextStyle(
                                      color: ColorConstant.defBlue,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ),
                        SizedBox(height: 100, child: Column())
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
