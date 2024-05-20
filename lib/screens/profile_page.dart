// lib/screens/profile_page.dart

import 'package:flutter/material.dart';
import '../widgets/profile_customization_section.dart';
import '../widgets/travel_history_section.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileCustomizationSection(),
            TravelHistorySection(),
          ],
        ),
      ),
    );
  }
}