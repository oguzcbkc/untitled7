import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bucket_model.dart';

class BucketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Bucket'),
      ),
      body: Consumer<BucketModel>(
        builder: (context, bucket, child) {
          return bucket.items.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: bucket.items.length,
            itemBuilder: (context, index) {
              final item = bucket.items[index];
              return ListTile(
                title: Text(item.title),
                subtitle: Text('\$${item.price}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    bucket.removeItem(item);
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
