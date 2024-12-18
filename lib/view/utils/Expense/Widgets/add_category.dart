import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class CategoryAddDialog extends StatelessWidget {
  const CategoryAddDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      title: Text('Add category'),
      content: TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: ColorConstant.defBlue, width: 2.0),
            ),
            hintText: "Amount",
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
