// lib/models/bucket_model.dart

import 'package:flutter/material.dart';

class BucketModel extends ChangeNotifier {
  final List<TourItem> _items = [];

  List<TourItem> get items => _items;

  void addItem(TourItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(TourItem item) {
    _items.remove(item);
    notifyListeners();
  }
}

class TourItem {
  final String title;
  final int price;

  TourItem({required this.title, required this.price});
}
