import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.keyboard_arrow_left,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: ColorConstant.defBlue,
        title: Text(
          "Expense Screen",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Amount",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            )
          ],
        ),
      ),
    );
  }
}
