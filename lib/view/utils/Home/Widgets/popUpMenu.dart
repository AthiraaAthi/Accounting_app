import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/view/utils/Home/Widgets/addAmount_dialog.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

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
    return PopupMenuButton<String>(
      color: white,
      icon: const Icon(Icons.more_vert),
      onSelected: (String value) {
        if (value == '1') {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AddPaymentDialog(state: model, type: type);
            },
          );
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
                        Navigator.pop(context);
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
              return AlertDialog(
                contentPadding: EdgeInsets.symmetric(vertical: 80),
                backgroundColor: white,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'H29A260302',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.copy_outlined,
                              color: black,
                            )),
                        IconButton(
                            onPressed: () {},
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
  }
}
