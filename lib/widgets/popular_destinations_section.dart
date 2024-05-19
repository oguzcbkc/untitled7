import 'package:flutter/material.dart';
import '../screens/destination_detail_page.dart';

class PopularDestinationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Destinations',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DestinationCard(
                  image: 'assets/popular-1.jpg',
                  title: 'Mykonos',
                  description: 'Sea, sun and the beach...',
                ),
                SizedBox(width: 16.0),
                DestinationCard(
                  image: 'assets/popular-2.jpg',
                  title: 'Paris',
                  description: 'Romantic times? Into history...',
                ),
                SizedBox(width: 16.0),
                DestinationCard(
                  image: 'assets/popular-3.jpg',
                  title: 'Istanbul',
                  description: 'One of the most magnificent...',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const DestinationCard({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DestinationDetailPage(title: title, image: image)),
        );
      },
      child: Container(
        width: 180.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'destination-image-$title',
                child: Image.asset(image, fit: BoxFit.cover, height: 120.0, width: 180.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
