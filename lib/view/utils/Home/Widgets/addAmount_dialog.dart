import 'dart:developer';

import 'package:curved_nav/Infrastructure/Lender/details.repository.dart';

import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';

import 'package:curved_nav/domain/models/history%20and%20others%20model/history_model.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

enum TypeOfAdding { addPayment, addAmount }

class AddPaymentDialog extends StatelessWidget {
  final LendingModel state;
  final TypeOfAdding type;
  const AddPaymentDialog({
    super.key,
    required this.state,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController addAmountController = TextEditingController();
    final id = state.id;
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
                controller: addAmountController,
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
              log(id.toString());

              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              final amount = addAmountController.text;
              final asPayment = type == TypeOfAdding.addPayment ? true : false;
              log(asPayment.toString());
              final model = HistoryModel(amount: amount, asPayment: asPayment);
              HistoryFunctions().addDetails(model, id!);

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
