import 'package:flutter/material.dart';
import '../screens/destination_detail_page.dart'; // Import DestinationDetailPage

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
                  details: '''
Mykonos is a popular Greek island known for its stunning beaches, vibrant nightlife, and picturesque villages. Visitors can enjoy:

- Beautiful sandy beaches such as Paradise Beach and Elia Beach.
- Charming streets and alleys in Mykonos Town.
- Historic sites like the Windmills and Paraportiani Church.
- Delicious Greek cuisine at local tavernas.
                  ''',
                ),
                SizedBox(width: 16.0),
                DestinationCard(
                  image: 'assets/popular-2.jpg',
                  title: 'Paris',
                  description: 'Romantic times? Into history...',
                  details: '''
Paris, the capital city of France, is renowned for its art, fashion, and culture. Highlights include:

- Iconic landmarks like the Eiffel Tower, Notre-Dame Cathedral, and the Louvre Museum.
- World-class art collections, including the Mona Lisa and Venus de Milo.
- Charming neighborhoods like Montmartre and Le Marais.
- Exquisite French cuisine and pastries in quaint cafes and restaurants.
                  ''',
                ),
                SizedBox(width: 16.0),
                DestinationCard(
                  image: 'assets/popular-3.jpg',
                  title: 'Istanbul',
                  description: 'One of the most magnificent...',
                  details: '''
Istanbul, a city that straddles Europe and Asia, is known for its rich history and vibrant culture. Key attractions include:

- The stunning Hagia Sophia and Blue Mosque.
- The bustling Grand Bazaar and Spice Market.
- The scenic Bosphorus Strait cruises.
- Delicious Turkish food including kebabs, baklava, and Turkish tea.
                  ''',
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
  final String details;

  const DestinationCard({
    required this.image,
    required this.title,
    required this.description,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationDetailPage(
              title: title,
              image: image,
              details: details,
            ),
          ),
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
