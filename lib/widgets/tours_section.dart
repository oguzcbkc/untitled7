// widgets/tours_section.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bucket_model.dart';
import '../models/tour_model.dart';
import '../models/favorites_model.dart';

class ToursSection extends StatelessWidget {
  final List<TourItem> tours = [
    TourItem(
      title: 'Unforgettable Beach Holiday in the Balkans',
      price: 750,
      image: 'assets/package-1.jpg',
      checkInDate: '',
      checkOutDate: '',
      numberOfPeople: 1,
      reviews: 25,
    ),
    TourItem(
      title: 'A Tour to the Kingdom',
      price: 520,
      image: 'assets/package-2.jpg',
      checkInDate: '',
      checkOutDate: '',
      numberOfPeople: 1,
      reviews: 20,
    ),
    TourItem(
      title: 'Far East\'s Secret Beauty',
      price: 660,
      image: 'assets/package-3.jpg',
      checkInDate: '',
      checkOutDate: '',
      numberOfPeople: 1,
      reviews: 40,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tours.length,
      itemBuilder: (context, index) {
        final tour = tours[index];
        return TourCard(tour: tour);
      },
    );
  }
}

class TourCard extends StatelessWidget {
  final TourItem tour;
  final TextEditingController _checkInController = TextEditingController();
  final TextEditingController _checkOutController = TextEditingController();
  final TextEditingController _numberOfPeopleController = TextEditingController();

  TourCard({required this.tour});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(tour.image, fit: BoxFit.cover, width: double.infinity, height: 200),
            SizedBox(height: 8),
            Text(
              tour.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('\$${tour.price} per person'),
            Text('${tour.reviews} reviews'),
            TextField(
              controller: _checkInController,
              decoration: InputDecoration(labelText: 'Check-In Date'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  _checkInController.text = pickedDate.toIso8601String().split('T').first;
                }
              },
            ),
            TextField(
              controller: _checkOutController,
              decoration: InputDecoration(labelText: 'Check-Out Date'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  _checkOutController.text = pickedDate.toIso8601String().split('T').first;
                }
              },
            ),
            TextField(
              controller: _numberOfPeopleController,
              decoration: InputDecoration(labelText: 'Number of People'),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () {
                    Provider.of<FavoritesModel>(context, listen: false).addFavorite(tour);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to Favorites')));
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_checkInController.text.isNotEmpty && _checkOutController.text.isNotEmpty && _numberOfPeopleController.text.isNotEmpty) {
                      final tourItem = TourItem(
                        title: tour.title,
                        price: tour.price,
                        image: tour.image,
                        checkInDate: _checkInController.text,
                        checkOutDate: _checkOutController.text,
                        numberOfPeople: int.parse(_numberOfPeopleController.text),
                        reviews: tour.reviews,
                      );
                      Provider.of<BucketModel>(context, listen: false).addItem(tourItem);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to Bucket')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
                    }
                  },
                  child: Text('Add to Bucket'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
