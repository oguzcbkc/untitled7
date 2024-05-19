import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bucket_model.dart';

class ToursSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Checkout Our Tours',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TourCard(
            image: 'assets/package-1.jpg',
            title: 'Unforgettable Beach Holiday in the Balkans',
            price: 750,
            reviews: 25,
          ),
          SizedBox(height: 16.0),
          TourCard(
            image: 'assets/package-2.jpg',
            title: 'A Tour to the Kingdom',
            price: 520,
            reviews: 20,
          ),
          SizedBox(height: 16.0),
          TourCard(
            image: 'assets/package-3.jpg',
            title: 'Far East\'s Secret Beauty',
            price: 660,
            reviews: 40,
          ),
        ],
      ),
    );
  }
}

class TourCard extends StatelessWidget {
  final String image;
  final String title;
  final int price;
  final int reviews;

  const TourCard({
    required this.image,
    required this.title,
    required this.price,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(image, fit: BoxFit.cover, width: 100, height: 100),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Reviews: $reviews',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Text(
                    '\$$price per person',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<BucketModel>(context, listen: false).addItem(TourItem(title: title, price: price));
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
