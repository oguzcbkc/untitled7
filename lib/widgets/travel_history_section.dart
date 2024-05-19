// lib/widgets/travel_history_section.dart

import 'package:flutter/material.dart';

class TravelHistorySection extends StatelessWidget {
  final List<Map<String, String>> travelHistory = [
    {'destination': 'Paris', 'date': '2023-03-15'},
    {'destination': 'New York', 'date': '2022-12-20'},
    {'destination': 'Tokyo', 'date': '2021-08-10'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Travel History',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Column(
            children: travelHistory.map((history) {
              return ListTile(
                title: Text(history['destination']!),
                subtitle: Text('Date: ${history['date']}'),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
