import 'package:curved_nav/view/utils/Expense/Widgets/add_category.dart';

import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

final date = DateFormat.yMd().format(DateTime(2024, 12, 31));

class _ExpenseScreenState extends State<ExpenseScreen> {
  TextEditingController _dateController = TextEditingController(text: date);
  TextEditingController _amountController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: ColorConstant.defBlue,
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorConstant.defBlue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      barrierDismissible: false,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      // Format the date and set it in the TextField

      final formattedDate = DateFormat.yMMMd().format(pickedDate);

      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  Future<dynamic> catogaryListBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: white,
      builder: (context) {
        return Wrap(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "Food",
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: Radio(
                        value: "Food",
                        activeColor: primaryColorBlue,
                        groupValue: '1',
                        fillColor: WidgetStatePropertyAll(primaryColorBlue),
                        onChanged: (String? value) {
                          setState(() {
                            _categoryController.text = value!;
                          });
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => CategoryAddDialog(),
                        );
                      },
                      child: Text(
                        'Add Category',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _dateController.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.white,
          ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: ColorConstant.defBlue, width: 2.0),
                    ),
                    hintText: "Amount",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _categoryController,
                readOnly: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: ColorConstant.defBlue, width: 2.0),
                    ),
                    hintText: "Category",
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: 40,
                        color: ColorConstant.defBlue,
                      ),
                      onPressed: () {
                        catogaryListBottomSheet(context);
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: ColorConstant.defBlue, width: 2.0),
                    ),
                    hintText: "Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _dateController,
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: ColorConstant.defBlue, width: 2.0),
                    ),
                    hintText: "Date",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: ColorConstant.defBlue),
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    width: 35,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: ColorConstant.defBlue),
                      onPressed: () {},
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
