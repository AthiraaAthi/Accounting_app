import 'dart:developer';

import 'package:curved_nav/Application/Calender/calender_bloc.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';
import 'package:curved_nav/Infrastructure/Lender/lender_repository.dart';
import 'package:curved_nav/domain/Share/share.dart';

import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/view/utils/Home/Widgets/addAmount_dialog.dart';
import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';
import 'package:curved_nav/view/utils/Settings/options_screens/getting_started.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuButtonWidget extends StatelessWidget {
  final LendingModel model;
  final TypeOfAdding type;
  const MenuButtonWidget({
    super.key,
    required this.model,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    DateTime normalizeDate(DateTime date) {
      return DateTime(date.year, date.month, date.day);
    }

    return BlocBuilder<CalenderBloc, CalenderState>(
      builder: (context, state) {
        return PopupMenuButton<String>(
          color: white,
          icon: const Icon(Icons.more_vert),
          onSelected: (String value) {
            if (value == '1') {
              final historyState = context.read<LenderBloc>().state;
              final eventsForSelectedDate = historyState.historyData
                  .where((e) =>
                      normalizeDate(e.date!.toDate()) ==
                      normalizeDate(state.dateTime!))
                  .toList();

              if (eventsForSelectedDate.length >= 2) {
                log("Exceed limit for this date");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: const Color.fromARGB(255, 255, 17, 0),
                      duration: Duration(seconds: 2),
                      content: Center(
                          child: Text(
                        'Exceed limit for this date.',
                        style: TextStyle(color: white),
                      ))),
                );
              } else {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return BlocBuilder<CalenderBloc, CalenderState>(
                      builder: (context, state) {
                        return AddPaymentDialog(
                          state: model,
                          type: type,
                          dateTime: state.dateTime!,
                        );
                      },
                    );
                  },
                );
              }
            } else if (value == '2') {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                    backgroundColor: white,
                    content: Text(
                      "Do You Want to Delete this Account?",
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "No",
                            style: TextStyle(color: black),
                          )),
                      TextButton(
                          onPressed: () {
                            LenderFunctions().deleteLender(model.id!);
                            context.read<LenderBloc>().add(GetData());
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavScreen(),
                                ),
                                (Route<dynamic> route) => false);
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(color: lightRed),
                          )),
                    ],
                  );
                },
              );
            } else if (value == '3') {
              showDialog(
                context: context,
                builder: (context) {
                  final code = model.shareCode!;
                  return AlertDialog(
                    contentPadding: EdgeInsets.symmetric(vertical: 80),
                    backgroundColor: white,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          code,
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (model.shareCode != null) {
                                    Clipboard.setData(
                                        ClipboardData(text: model.shareCode!));
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: primaryColorBlue,
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          content: Center(
                                              child: Text(
                                                  'Copied to clipboard!'))),
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.copy_outlined,
                                  color: black,
                                )),
                            IconButton(
                                onPressed: () {
                                  if (model.shareCode != null) {
                                    shareCode(model.shareCode!);
                                  }
                                },
                                icon: Icon(
                                  Icons.share_outlined,
                                  color: black,
                                )),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    GettingStarted(type: NavigatingFrom.HelpPage),
              ));
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: '1',
                child: Text('Add Amount'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('Delete Account'),
              ),
              PopupMenuItem(
                value: '3',
                child: Text('Share'),
              ),
              PopupMenuItem(
                value: '4',
                child: Text('Help'),
              ),
            ];
          },
        );
      },
    );
  }
}
