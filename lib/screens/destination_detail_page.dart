import 'package:flutter/material.dart';

class DestinationDetailPage extends StatelessWidget {
  final String title;
  final String image;
  final String details;

  const DestinationDetailPage({
    required this.title,
    required this.image,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'destination-image-$title',
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                details,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
