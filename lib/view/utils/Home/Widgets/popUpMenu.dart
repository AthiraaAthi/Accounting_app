import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget({
    super.key,
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
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
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
            },
          );
        } else if (value == '2') {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                backgroundColor: white,
                content: Text("Do You Want to Delete this Account?"),
                actions: [
                  TextButton(onPressed: () {}, child: Text("No")),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Yes",
                        style: TextStyle(),
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
