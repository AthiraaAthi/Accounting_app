import 'package:flutter/material.dart';

class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (String value) {},
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'Add Amount',
            child: Text('Add Amount'),
          ),
          PopupMenuItem(
            value: 'Delete Account',
            child: Text('Delete Account'),
          ),
          PopupMenuItem(
            value: 'Share',
            child: Text('Share'),
          ),
          PopupMenuItem(
            value: 'Help',
            child: Text('Help'),
          ),
        ];
      },
    );
  }
}
