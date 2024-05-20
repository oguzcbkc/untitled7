import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bucket_model.dart';
import 'payment_page.dart';

class BucketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Bucket'),
      ),
      body: Consumer<BucketModel>(
        builder: (context, bucket, child) {
          return bucket.items.isEmpty
              ? Center(child: Text('Your Bucket is empty'))
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentPage()),
          );
        },
        child: Icon(Icons.payment),
      ),
    );
  }
}
