// models/tour_model.dart
class TourItem {
  final String title;
  final double price;
  final String image;
  final String checkInDate;
  final String checkOutDate;
  final int numberOfPeople;
  final int reviews;

  TourItem({
    required this.title,
    required this.price,
    required this.image,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfPeople,
    required this.reviews,
  });
}
