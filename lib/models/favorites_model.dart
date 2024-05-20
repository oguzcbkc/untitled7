import 'package:flutter/foundation.dart';
import 'tour_model.dart';

class FavoritesModel extends ChangeNotifier {
  final List<TourItem> _favorites = [];

  List<TourItem> get favorites => _favorites;

  void addFavorite(TourItem item) {
    if (!_favorites.contains(item)) {
      _favorites.add(item);
      notifyListeners();
    }
  }

  void removeFavorite(TourItem item) {
    _favorites.remove(item);
    notifyListeners();
  }
}
