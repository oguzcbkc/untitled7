import 'package:flutter/material.dart';

class VirtualToursSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Virtual Tours',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              // Open virtual tour
            },
            child: Image.asset('assets/virtual_tour.jpg', fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
