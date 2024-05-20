// models/bucket_model.dart
import 'package:flutter/foundation.dart';
import 'tour_model.dart';

class BucketModel extends ChangeNotifier {
  final List<TourItem> _items = [];
  final List<TourItem> _bookings = []; // Add this line to manage bookings

  List<TourItem> get items => _items;
  List<TourItem> get bookings => _bookings; // Add this line to get bookings

  void addItem(TourItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(TourItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void addBooking(TourItem item) { // Add this method to add bookings
    _bookings.add(item);
    notifyListeners();
  }

  void removeBooking(TourItem item) { // Add this method to remove bookings
    _bookings.remove(item);
    notifyListeners();
  }

  void clearItems() { // Add this method to clear items after payment
    _items.clear();
    notifyListeners();
  }
}
