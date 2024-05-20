import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/tour_model.dart';
import '../models/bucket_model.dart';
import 'bucket_page.dart'; // Import the BucketPage

class BookingPage extends StatefulWidget {
  final TourItem tour;

  BookingPage({required this.tour});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final _checkInController = TextEditingController();
  final _checkOutController = TextEditingController();
  final _numPeopleController = TextEditingController();
  DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void dispose() {
    _checkInController.dispose();
    _checkOutController.dispose();
    _numPeopleController.dispose();
    super.dispose();
  }

  void _bookTour() {
    if (_formKey.currentState!.validate()) {
      final tourItem = TourItem(
        title: widget.tour.title,
        price: widget.tour.price,
        image: widget.tour.image,
        checkInDate: _checkInController.text,
        checkOutDate: _checkOutController.text,
        numberOfPeople: int.parse(_numPeopleController.text),
        reviews: widget.tour.reviews,
      );

      Provider.of<BucketModel>(context, listen: false).addItem(tourItem);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BucketPage()), // Correctly navigate to BucketPage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${widget.tour.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _checkInController,
                decoration: InputDecoration(labelText: 'Check-In Date'),
                keyboardType: TextInputType.datetime,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _checkInController.text = _dateFormat.format(pickedDate);
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a check-in date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _checkOutController,
                decoration: InputDecoration(labelText: 'Check-Out Date'),
                keyboardType: TextInputType.datetime,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _checkOutController.text = _dateFormat.format(pickedDate);
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a check-out date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numPeopleController,
                decoration: InputDecoration(labelText: 'Number of People'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of people';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _bookTour,
                child: Text('Add to Bucket'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
