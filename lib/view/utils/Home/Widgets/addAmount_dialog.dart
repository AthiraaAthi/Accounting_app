import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class AddPaymentDialog extends StatelessWidget {
  const AddPaymentDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      title: Center(child: Text("Enter Amount")),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_circle_outline,
                    size: 38,
                    color: Colors.grey,
                  ))),
          Expanded(
              flex: 6,
              child: TextField(
                textAlign: TextAlign.center,
                cursorColor: primaryColorBlue,
                maxLength: 6,
                style: TextStyle(fontSize: 35),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    counterText: ' ',
                    hintText: '0',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              )),
          Expanded(
              flex: 2,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 38,
                    color: Colors.grey,
                  ))),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Add',
              style: TextStyle(color: primaryColorBlue),
            )),
      ],
    );
  }
}
