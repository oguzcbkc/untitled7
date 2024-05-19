import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InteractiveMapSection extends StatefulWidget {
  @override
  _InteractiveMapSectionState createState() => _InteractiveMapSectionState();
}

class _InteractiveMapSectionState extends State<InteractiveMapSection> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(51.5, -0.09);
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('id-1'),
      position: LatLng(51.5, -0.09),
      infoWindow: InfoWindow(
        title: 'London',
        snippet: 'Popular Destination',
      ),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore on Map',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 13.0,
                ),
                markers: _markers,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
