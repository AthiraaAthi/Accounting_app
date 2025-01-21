import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<LenderBloc>().add(History(id: widget.model.id!));
      },
    );
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
        title: Text("${widget.model.name}"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CalenderBloc, CalenderState>(
              builder: (context, state) {
                dateTime = state.dateTime ?? DateTime.now();
                log('date is ${dateTime}');
                return CalenderWidget(
                  state: widget.model,
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
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        foregroundColor: WidgetStatePropertyAll(white),
                        backgroundColor:
                            WidgetStatePropertyAll(primaryColorBlue)),
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AddPaymentDialog(
                          type: TypeOfAdding.addPayment,
                          state: widget.model,
                          dateTime: dateTime!,
                        ),
                      );
                    },
                    child: Text("Add Payment"))
                : SizedBox(),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: lightBlue,
                  leading: Text("Selected date Event"),
                  trailing: Text("No Data"),
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
                                    state: widget.model,
                                  ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var tween = Tween(
                                      begin: const Offset(1.0, 0.0),
                                      end: Offset.zero,
                                    ).chain(CurveTween(curve: Curves.easeIn));
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            tileColor:
                                items.asPayment == true ? lightGreen : lightRed,
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
              Text(
                "${widget.model.balanceAmount}\\-",
                style: TextStyle(color: white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
