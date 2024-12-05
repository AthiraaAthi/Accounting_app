import 'package:curved_nav/view/utils/Expense/expense_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';

import 'package:flutter/material.dart';

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
        children: [],
      ),
    );
  }
}
