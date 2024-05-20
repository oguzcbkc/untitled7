import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorites_model.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favorites, child) {
          return favorites.favorites.isEmpty
              ? Center(child: Text('No favorite tours added'))
              : ListView.builder(
            itemCount: favorites.favorites.length,
            itemBuilder: (context, index) {
              final tour = favorites.favorites[index];
              return ListTile(
                leading: Image.asset(tour.image),
                title: Text(tour.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$${tour.price} per person'),
                    Text('${tour.reviews} reviews'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    favorites.removeFavorite(tour);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
