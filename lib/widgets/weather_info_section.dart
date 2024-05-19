import 'package:flutter/material.dart';

class WeatherInfoSection extends StatelessWidget {
  final String destination;

  const WeatherInfoSection({required this.destination});

  @override
  Widget build(BuildContext context) {
    // For demonstration, let's use static data. Ideally, you would fetch this from a weather API.
    return Card(
      child: ListTile(
        title: Text('Current Weather in $destination'),
        subtitle: Text('25°C, Sunny'),
        leading: Icon(Icons.wb_sunny),
      ),
    );
  }
}
