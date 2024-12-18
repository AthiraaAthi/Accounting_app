import 'package:curved_nav/Infrastructure/Category/category_repository.dart';
import 'package:curved_nav/domain/models/category%20model/category_model.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class CategoryAddDialog extends StatelessWidget {
  CategoryAddDialog({
    super.key,
  });

  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      title: Text('Add category'),
      content: TextField(
        controller: _amountController,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: ColorConstant.defBlue, width: 2.0),
            ),
            hintText: "Name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: black),
          ),
        ),
        TextButton(
          onPressed: () {
            final name = _amountController.text;

            CategoryFunctions().categoryAdd(CategoryModel(categoryName: name));

            Navigator.pop(context);
          },
          child: Text(
            'Add',
            style: TextStyle(color: primaryColorBlue),
          ),
        )
      ],
    );
  }
}
