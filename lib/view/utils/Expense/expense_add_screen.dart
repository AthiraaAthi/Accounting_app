import 'package:curved_nav/view/utils/Expense/add_category.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  String selectedCategory = 'Category';
  TextEditingController _dateController = TextEditingController();
  @override
  void dispose() {
    _dateController.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );
    if (pickedDate != null) {
      // Format the date and set it in the TextField
      String formattedDate =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      setState(() {
        _dateController.text = formattedDate;
      });
    }
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
                        _showCategoryDialog(context);
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

  void _showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Food"),
                trailing: Radio(
                  value: "Food",
                  groupValue: selectedCategory,
                  onChanged: (String? value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Travel"),
                trailing: Radio(
                  value: "Travel",
                  groupValue: selectedCategory,
                  onChanged: (String? value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Add Category"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCategory(),
                      ));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
