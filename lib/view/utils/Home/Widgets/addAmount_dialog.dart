import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';

import 'package:curved_nav/Infrastructure/Lender/details.repository.dart';
import 'package:curved_nav/Infrastructure/Lender/lender_repository.dart';

import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';

import 'package:curved_nav/domain/models/history%20and%20others%20model/history_model.dart';

import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TypeOfAdding { addPayment, addAmount }

class AddPaymentDialog extends StatefulWidget {
  final LendingModel state;
  final TypeOfAdding type;
  final DateTime dateTime;
  const AddPaymentDialog({
    super.key,
    required this.state,
    required this.type,
    required this.dateTime,
  });

  @override
  State<AddPaymentDialog> createState() => _AddPaymentDialogState();
}

class _AddPaymentDialogState extends State<AddPaymentDialog> {
  String? initialValue;

  @override
  Widget build(BuildContext context) {
    final TextEditingController addAmountController = TextEditingController();
    final id = widget.state.id!;

    setState(() {
      initialValue = widget.state.installmentAmount!.isNotEmpty
          ? widget.state.installmentAmount
          : addAmountController.text;
      widget.type == TypeOfAdding.addPayment
          ? addAmountController.text = initialValue!
          : null;
    });
    return AlertDialog(
      backgroundColor: white,
      title: Center(child: Text("Enter Amount")),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 6,
              child: TextFormField(
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
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              log(id.toString());

              Navigator.pop(context);
            },
            child: Text('Cancel')),
        BlocBuilder<LenderBloc, LenderState>(
          builder: (context, state) {
            final balanceAmount = state.data
                .firstWhere((element) => element.id == id)
                .balanceAmount;
            log('ua: ${balanceAmount}');
            return TextButton(
                onPressed: () async {
                  final amount = widget.type == TypeOfAdding.addPayment
                      ? '-${addAmountController.text}\\-'
                      : '+${addAmountController.text}\\-';
                  final asPayment =
                      widget.type == TypeOfAdding.addPayment ? true : false;
                  log(asPayment.toString());
                  final date = Timestamp.fromDate(widget.dateTime);
                  final model = HistoryModel(
                      amount: amount, asPayment: asPayment, date: date);

                  int parseSafe(String value) {
                    return int.tryParse(value) ?? 0;
                  }

                  final newBalance = widget.type == TypeOfAdding.addPayment
                      ? parseSafe(balanceAmount!) -
                          parseSafe(addAmountController.text)
                      : parseSafe(balanceAmount!) +
                          parseSafe(addAmountController.text);
                  log('balance amount: ${balanceAmount.toString()}');
                  log(newBalance.toString());

                  final lastDate =
                      '${widget.dateTime.day}/${widget.dateTime.month}/${widget.dateTime.year}';
                  await LenderFunctions()
                      .updateLastDate('lastMoneyGivenDate', lastDate, id);
                  await LenderFunctions().updateBalanceAmount(
                      'balanceAmount', newBalance.toString(), id);
                  await HistoryFunctions().addDetails(model, id);

                  context.read<LenderBloc>().add(History(id: id));
                  context.read<LenderBloc>().add(GetData());

                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: primaryColorBlue),
                ));
          },
        ),
      ],
    );
  }
}
