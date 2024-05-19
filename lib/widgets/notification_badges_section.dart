import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class NotificationBadgesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notifications',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          ListTile(
            leading: badges.Badge(
              child: Icon(Icons.notifications),
              badgeContent: Text('3'),
            ),
            title: Text('New Notifications'),
          ),
        ],
      ),
    );
  }
}
