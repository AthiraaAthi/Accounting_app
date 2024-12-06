import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  String selectedCategory = 'Category';
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
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                  hintText: "Category",
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 40,
                      color: ColorConstant.defBlue,
                    ),
                    onPressed: () {
                      _showCategoryDialog(context);
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ],
        ),
      ),
    );
  }

  void _showCategoryDialog(BuildContext context) {}
}
