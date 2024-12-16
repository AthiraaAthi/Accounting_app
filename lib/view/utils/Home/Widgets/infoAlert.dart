import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            trailing: CircleAvatar(
              radius: 10,
              backgroundColor: lightRed,
            ),
            title: Text("Added amount"),
          ),
          ListTile(
            trailing: CircleAvatar(
              radius: 10,
              backgroundColor: lightGreen,
            ),
            title: Text("Paid"),
          ),
          ListTile(
            trailing: CircleAvatar(
              radius: 10,
              backgroundColor: orenge,
            ),
            title: Text("Pending"),
          ),
        ],
      ),
    );
  }
}
