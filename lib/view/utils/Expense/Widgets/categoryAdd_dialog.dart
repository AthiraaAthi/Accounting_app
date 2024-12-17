import 'package:curved_nav/view/utils/Expense/Widgets/add_category.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class CategoryAddingDialog extends StatefulWidget {
  const CategoryAddingDialog({super.key});

  @override
  State<CategoryAddingDialog> createState() => _CategoryAddingDialogState();
}

class _CategoryAddingDialogState extends State<CategoryAddingDialog> {
  String selectedCategory = 'Category';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text("Food"),
            trailing: Radio(
              value: "1",
              activeColor: primaryColorBlue,
              groupValue: selectedCategory,
              fillColor: WidgetStatePropertyAll(primaryColorBlue),
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
              value: "2",
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
  }
}
