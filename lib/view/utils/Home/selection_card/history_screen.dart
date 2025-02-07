import 'dart:developer';

import 'package:card_loading/card_loading.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/domain/models/history%20and%20others%20model/history_model.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  final LendingModel lendingModel;
  const HistoryScreen({super.key, required this.lendingModel});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<LenderBloc>().add(History(id: lendingModel.id!));
      },
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 30,
            )),
        backgroundColor: primaryColorBlue,
        foregroundColor: white,
        title: Text("History"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: BlocBuilder<LenderBloc, LenderState>(
              builder: (context, state) {
                if (state.isError) {
                  return Center(child: Icon(Icons.wifi));
                } else if (state.isLoading) {
                  return Column(
                    children: [
                      CardLoading(
                        height: 74,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      CardLoading(
                        height: 74,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      CardLoading(
                        height: 74,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      CardLoading(
                        height: 74,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      CardLoading(
                        height: 74,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ],
                  );
                }
                final sortedData = List<HistoryModel>.from(state.historyData);
                sortedData.sort((a, b) => b.timestamp!.compareTo(a.timestamp!));
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: sortedData.length,
                  itemBuilder: (context, index) {
                    final data = sortedData[index];
                    final date = data.date!.toDate();
                    final formatedDate =
                        '${date.day}/${date.month}/${date.year}';
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 6),
                      child: ListTile(
                        subtitle: Text("Balance Amount:1000"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tileColor: data.asPayment! ? lightGreen : lightRed,
                        title: Text(formatedDate),
                        trailing: Text('-${data.amount}/-'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: primaryColorBlue,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Balance amount:',
                    style: TextStyle(color: white),
                  ),
                  BlocBuilder<LenderBloc, LenderState>(
                    builder: (context, state) {
                      final amount = state.data
                          .firstWhere(
                              (element) => element.id == lendingModel.id)
                          .balanceAmount
                          .toString();
                      if (state.isLoading) {
                        return SizedBox();
                      }
                      log('updated balance amount: $amount');
                      return Text(
                        "${amount}\\-",
                        style: TextStyle(color: white),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
