import 'package:flutter/material.dart';

class DestinationDetailPage extends StatelessWidget {
  final String title;
  final String image;

  const DestinationDetailPage({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'destination-image-$title',
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Text('Details about $title'),
          ],
        ),
      ),
    );
  }
}
