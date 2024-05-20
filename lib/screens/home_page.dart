import 'package:flutter/material.dart';
import '../widgets/search_section.dart';
import '../widgets/popular_destinations_section.dart';
import '../widgets/tours_section.dart';
import '../widgets/gallery_section.dart';
import '../widgets/interactive_map_section.dart';
import '../widgets/ratings_reviews_section.dart';
import '../widgets/social_sharing_section.dart';
import '../widgets/expandable_cards_section.dart';
import 'notifications_page.dart';
import 'tours_page.dart';  // Ensure this import

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('Favorites'),
              onTap: () {
                Navigator.pushNamed(context, '/favorites');
              },
            ),
            ListTile(
              title: Text('Bucket'),
              onTap: () {
                Navigator.pushNamed(context, '/bucket');
              },
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Tours'),  // Add this ListTile
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ToursPage()),
                );
              },
            ),
            ListTile(
              title: Text('My Bookings'),  // Add this ListTile
              onTap: () {
                Navigator.pushNamed(context, '/bookings');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchSection(),
            PopularDestinationsSection(),
            GallerySection(),
            InteractiveMapSection(),
            RatingsAndReviewsSection(),
            SocialSharingSection(),
            ExpandableCardsSection(),
          ],
        ),
      ),
    );
  }
}
