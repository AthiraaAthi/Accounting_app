import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isGeneralNotificationOn = true;
  bool isDueReminderOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorConstant.defBlue,
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'General Notification',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Switch(
                  activeTrackColor: ColorConstant.defBlue,
                  thumbColor: WidgetStatePropertyAll(Colors.white),
                  inactiveTrackColor: Colors.grey,
                  value: isGeneralNotificationOn,
                  onChanged: (value) {
                    setState(() {
                      isGeneralNotificationOn = value;
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Due Reminder',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Switch(
                  activeTrackColor: ColorConstant.defBlue,
                  thumbColor: WidgetStatePropertyAll(Colors.white),
                  inactiveTrackColor: Colors.grey,
                  value: isGeneralNotificationOn,
                  onChanged: (value) {
                    setState(() {
                      isGeneralNotificationOn = value;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
