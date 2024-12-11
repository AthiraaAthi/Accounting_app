import 'dart:developer';

import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

AlertDialog alertWidget(bool isSelected, BuildContext context,
    TabController controller, bool isMoneyLending, double? height) {
  return AlertDialog(
    backgroundColor: white,
    title: Center(
      child: Text('Add new card'),
    ),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Column(
              children: [
                TabBar(
                  controller: controller,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
                  indicatorColor: primaryColorBlue,
                  indicatorWeight: 4.0,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  dividerColor: white,
                  unselectedLabelStyle: TextStyle(fontSize: 12),
                  tabs: [
                    Tab(text: "Create"),
                    Tab(text: "Join"),
                  ],
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    controller.addListener(() {
                      if (controller.index == 0) {
                        setState(
                          () {
                            isSelected = true;
                            log(isSelected.toString());
                          },
                        );
                      } else if (controller.index == 1) {
                        setState(
                          () {
                            isSelected = false;
                            log(isSelected.toString());
                          },
                        );
                      }
                    });

                    if (isSelected) {
                      setState(
                        () {
                          height = 550;
                        },
                      );
                    } else if (!isSelected) {
                      setState(
                        () {
                          height = 120;
                        },
                      );
                    } else if (isMoneyLending) {
                      setState(
                        () {
                          height = 550;
                        },
                      );
                    } else if (!isMoneyLending) {
                      setState(
                        () {
                          height = 400;
                        },
                      );
                    }

                    return AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: height,
                      //  isSelected ? 550 : 120,
                      width: 600,
                      child: TabBarView(
                        controller: controller,
                        children: [
                          SingleChildScrollView(
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Money Lender",
                                  ),
                                  Switch(
                                    activeColor: ColorConstant.defBlue,
                                    value: isMoneyLending,
                                    thumbColor:
                                        WidgetStatePropertyAll(Colors.white),
                                    inactiveThumbColor: ColorConstant.defBlue,
                                    focusColor: ColorConstant.defBlue,
                                    trackColor: WidgetStatePropertyAll(
                                      ColorConstant.defBlue,
                                    ),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          isMoneyLending = value;
                                        },
                                      );
                                    },
                                  ),
                                  Text(
                                    "To Give",
                                  ),
                                ],
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  floatingLabelStyle:
                                      TextStyle(color: primaryColorBlue),
                                  hintStyle: TextStyle(fontSize: 15),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryColorBlue),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Phone (Optional)",
                                  floatingLabelStyle:
                                      TextStyle(color: primaryColorBlue),
                                  hintStyle: TextStyle(fontSize: 15),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryColorBlue),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                maxLines: 4,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 50, top: 30),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryColorBlue),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Description (Optional)",
                                  floatingLabelStyle:
                                      TextStyle(color: primaryColorBlue),
                                  hintStyle: TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                decoration: InputDecoration(
                                  floatingLabelStyle:
                                      TextStyle(color: primaryColorBlue),
                                  hintText: "Amount (With interest if any)",
                                  hintStyle: TextStyle(fontSize: 15),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryColorBlue),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 15),
                              isMoneyLending
                                  ? SizedBox()
                                  : TextField(
                                      decoration: InputDecoration(
                                        hintText: "Installment Amount",
                                        floatingLabelStyle:
                                            TextStyle(color: primaryColorBlue),
                                        hintStyle: TextStyle(fontSize: 15),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColorBlue),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                              SizedBox(height: 15),
                              isMoneyLending
                                  ? SizedBox()
                                  : DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        hintText: "Installment Type",
                                        hintStyle: TextStyle(fontSize: 15),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColorBlue),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: "Daily",
                                          child: Text("Daily"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Weekly",
                                          child: Text("Weekly"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Monthly",
                                          child: Text("Monthly"),
                                        ),
                                      ],
                                      onChanged: (value) {},
                                    ),
                            ]),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter code",
                                  floatingLabelStyle:
                                      TextStyle(color: primaryColorBlue),
                                  hintStyle: TextStyle(fontSize: 15),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryColorBlue),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          isSelected
              ? Navigator.pop(context)
              : Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavScreen(),
                  ),
                  (Route<dynamic> route) => false);
        },
        child: const Text(
          "Cancel",
          style: TextStyle(color: Colors.black),
        ),
      ),
      TextButton(
        onPressed: () {
          isSelected
              ? Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavScreen(),
                  ),
                  (Route<dynamic> route) => false)
              : showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Center(child: Text('Code details')),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('Name: Name'), Text('Amount: 30000/-')],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              foregroundColor: WidgetStatePropertyAll(black)),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                foregroundColor:
                                    WidgetStatePropertyAll(primaryColorBlue)),
                            child: Text('Add'))
                      ],
                    );
                  });
        },
        child: Text(
          isSelected ? 'Create' : 'Add',
          style: TextStyle(
            color: ColorConstant.defBlue,
          ),
        ),
      ),
    ],
  );
}
