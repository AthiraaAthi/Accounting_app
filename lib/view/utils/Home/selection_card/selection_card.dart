import 'dart:developer';

import 'package:card_loading/card_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_nav/Application/Advertisment/ad_bloc.dart';
import 'package:curved_nav/Application/Calender/calender_bloc.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';

import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/domain/models/history%20and%20others%20model/history_model.dart';
import 'package:curved_nav/view/utils/Home/Widgets/calender.dart';
import 'package:curved_nav/view/utils/Home/Widgets/infoAlert.dart';
import 'package:curved_nav/view/utils/Home/Widgets/popUpMenu.dart';
import 'package:curved_nav/view/utils/Home/selection_card/history_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/addAmount_dialog.dart';

class SelectionCard extends StatefulWidget {
  final LendingModel model;
  final bool isCreator;
  SelectionCard({super.key, required this.isCreator, required this.model});

  @override
  State<SelectionCard> createState() => _SelectionCardState();
}

class _SelectionCardState extends State<SelectionCard> {
  DateTime? dateTime;

  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<LenderBloc>().add(History(id: widget.model.id!));
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<LenderBloc>().add(GetData());
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<AdBloc>().add(AdEvent.interstatial());
      },
    );

    log('balance amount: ${widget.model.balanceAmount}');

    final usedId = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = FirebaseFirestore.instance
        .collection('users')
        .doc(usedId)
        .collection('lender')
        .doc(widget.model.id)
        .collection('details')
        .orderBy('timestamp', descending: true)
        .snapshots();
    final payType = widget.model.installmentType == '1'
        ? 'Daily Pay'
        : widget.model.installmentType == '2'
            ? 'Weekly Pay'
            : 'Monthly Pay';
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => InfoWidget(),
                );
              },
              icon: Icon(Icons.info_outline)),
          widget.isCreator
              ? MenuButtonWidget(
                  model: widget.model,
                  type: TypeOfAdding.addAmount,
                )
              : SizedBox(),
        ],
        surfaceTintColor: primaryColorBlue,
        foregroundColor: white,
        title: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: white,
                    title: Center(child: Text("Details")),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Text("Name:"),
                          title: Text(widget.model.name!),
                        ),
                        widget.model.phone!.isNotEmpty
                            ? ListTile(
                                leading: Text("Phone:"),
                                title: Text(widget.model.phone!),
                              )
                            : SizedBox(),
                        widget.model.description!.isNotEmpty
                            ? ListTile(
                                leading: Text("Description:"),
                                title: Text("${widget.model.description}"),
                              )
                            : SizedBox(),
                        ListTile(
                          leading: Text("Full Amount:"),
                          title: Text("${widget.model.amount}/-"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.model.name}",
                  style: TextStyle(color: white, fontSize: 20),
                ),
                Text(
                  "Tap here...",
                  style: TextStyle(color: white, fontSize: 11),
                ),
              ],
            )),
        backgroundColor: ColorConstant.defBlue,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Container(
            decoration: BoxDecoration(color: white),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Amount"),
                      Text("${widget.model.amount}/-")
                    ],
                  ),
                ),
                Text(payType)
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<LenderBloc, LenderState>(
        builder: (context, state) {
          if (state.isError) {
            return Center(child: Icon(Icons.wifi));
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<CalenderBloc, CalenderState>(
                  builder: (context, state) {
                    dateTime = state.dateTime ?? DateTime.now();
                    return CalenderWidget(
                      lendingModel: widget.model,
                    );
                  },
                ),
                Container(
                  height: 20,
                  color: white,
                ),
                widget.isCreator
                    ? ElevatedButton(
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            foregroundColor: WidgetStatePropertyAll(white),
                            backgroundColor:
                                WidgetStatePropertyAll(primaryColorBlue)),
                        onPressed: () {
                          final historyState = context.read<LenderBloc>().state;
                          final eventsForSelectedDate = historyState.historyData
                              .where((e) =>
                                  normalizeDate(e.date!.toDate()) ==
                                  normalizeDate(dateTime!))
                              .toList();

                          if (eventsForSelectedDate.length >= 2) {
                            log("Exceed limit for this date");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 17, 0),
                                  duration: Duration(seconds: 2),
                                  content: Center(
                                      child: Text(
                                    'Exceed limit for this date.',
                                    style: TextStyle(color: white),
                                  ))),
                            );
                          } else {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => AddPaymentDialog(
                                type: TypeOfAdding.addPayment,
                                state: widget.model,
                                dateTime: dateTime!,
                              ),
                            );
                          }
                        },
                        child: Text("Add Payment"))
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: BlocBuilder<CalenderBloc, CalenderState>(
                      builder: (context, state) {
                        final selectedDate = state.dateTime ?? DateTime.now();

                        return BlocBuilder<LenderBloc, LenderState>(
                          builder: (context, state) {
                            if (state.isLoading) {
                              return CardLoading(
                                height: 55,
                                borderRadius: BorderRadius.circular(20),
                              );
                            }
                            final selectedDateEvents = state.historyData
                                .where((e) =>
                                    normalizeDate(e.date!.toDate()) ==
                                    normalizeDate(selectedDate))
                                .toList();

                            if (selectedDateEvents.isEmpty) {
                              return ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                tileColor: lightBlue,
                                leading: Text("Selected date Event"),
                                trailing: Text("No event"),
                              );
                            }
                            final firstEvent = selectedDateEvents[0];
                            final firstEventText = firstEvent.asPayment!
                                ? "Payment Added"
                                : "Amount Added";

                            final secondEvent = selectedDateEvents.length > 1
                                ? selectedDateEvents[1]
                                : null;
                            final secondEventText = secondEvent != null
                                ? (secondEvent.asPayment!
                                    ? "Payment Added"
                                    : "Amount Added")
                                : null;

                            return Column(
                              children: [
                                ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  tileColor: lightBlue,
                                  leading: Text("Selected date Event"),
                                  trailing: Text(firstEventText),
                                ),
                                if (secondEvent != null)
                                  SizedBox(
                                    height: 10,
                                  ),
                                if (secondEvent != null)
                                  ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    tileColor: lightBlue,
                                    leading: Text("Selected date event"),
                                    trailing: Text(secondEventText!),
                                  ),
                                if (secondEvent == null) SizedBox(),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "History",
                        style: TextStyle(color: black),
                      ),
                      BlocBuilder<LenderBloc, LenderState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              state.historyData.isNotEmpty
                                  ? Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          HistoryScreen(
                                        lendingModel: widget.model,
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var tween = Tween(
                                          begin: const Offset(1.0, 0.0),
                                          end: Offset.zero,
                                        ).chain(
                                            CurveTween(curve: Curves.easeIn));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ))
                                  : null;
                            },
                            child: Text(
                              "Show more >",
                              style: TextStyle(
                                  color: primaryColorBlue,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: snapshot,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: SizedBox());
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(child: Text('No history available.'));
                      }
                      final docs = snapshot.data!.docs;
                      final data = docs
                          .map((doc) => HistoryModel.fromJson(
                              doc.data() as Map<String, dynamic>))
                          .toList();
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final items = data[index];
                          final date = items.date!.toDate();
                          final formatedDate =
                              '${date.day}/${date.month}/${date.year}';
                          log(formatedDate);
                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                tileColor: items.asPayment == true
                                    ? lightGreen
                                    : lightRed,
                                leading: Text(formatedDate,
                                    style: TextStyle(color: black)),
                                trailing: Text(
                                  '${items.amount}',
                                  style: TextStyle(color: black),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: data.length > 4 ? 4 : data.length,
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
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
                      .firstWhere((element) => element.id == widget.model.id)
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
      ),
    );
  }
}
