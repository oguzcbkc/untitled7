import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bucket_model.dart';

class BookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
      ),
      body: Consumer<BucketModel>(
        builder: (context, bucket, child) {
          return bucket.bookings.isEmpty
              ? Center(child: Text('No bookings made'))
              : ListView.builder(
            itemCount: bucket.bookings.length,
            itemBuilder: (context, index) {
              final booking = bucket.bookings[index];
              return ListTile(
                leading: Image.asset(booking.image),
                title: Text(booking.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Check-in: ${booking.checkInDate}'),
                    Text('Check-out: ${booking.checkOutDate}'),
                    Text('People: ${booking.numberOfPeople}'),
                    Text('\$${booking.price} per person'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
