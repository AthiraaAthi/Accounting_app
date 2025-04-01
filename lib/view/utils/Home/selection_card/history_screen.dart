import 'package:card_loading/card_loading.dart';
import 'package:curved_nav/Application/Advertisment/ad_bloc.dart';
import 'package:curved_nav/Application/Join/join_bloc.dart';
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
        context.read<LenderBloc>().add(
            History(id: lendingModel.id!, isJoiner: lendingModel.asJoiner!));
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<AdBloc>().add(AdEvent.interstatial());
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
          Container(
            width: double.infinity,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<LenderBloc, LenderState>(
                builder: (context, state) {
                  final totalPayment = state.historyData
                      .where(
                        (element) {
                          return element.asPayment!;
                        },
                      )
                      .toList()
                      .length;
                  final totaladdAmount = state.historyData
                      .where(
                        (element) {
                          return element.asPayment == false;
                        },
                      )
                      .toList()
                      .length;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total payment :     '),
                          Text('Total added amount :     '),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(totalPayment.toString()),
                          Text(totaladdAmount.toString()),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tileColor: data.asPayment! ? lightGreen : lightRed,
                        title: Text(formatedDate),
                        trailing: Text('${data.amount}'),
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
                  lendingModel.asJoiner!
                      ? BlocBuilder<JoinBloc, JoinState>(
                          builder: (context, state) {
                            final amount = state.joinData
                                .firstWhere(
                                    (element) => element.id == lendingModel.id)
                                .balanceAmount
                                .toString();
                            if (state.isLoading) {
                              return SizedBox();
                            } else if (amount.isEmpty) {
                              return SizedBox();
                            }

                            return Text(
                              "${amount}\\-",
                              style: TextStyle(color: white),
                            );
                          },
                        )
                      : BlocBuilder<LenderBloc, LenderState>(
                          builder: (context, state) {
                            final amount = state.data
                                .firstWhere(
                                    (element) => element.id == lendingModel.id)
                                .balanceAmount
                                .toString();
                            if (state.isLoading) {
                              return SizedBox();
                            }

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
