import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GallerySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Photos From Travellers',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16/9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
            items: [
              'assets/gallery-1.jpg',
              'assets/gallery-2.jpg',
              'assets/gallery-3.jpg',
              'assets/gallery-4.jpg',
              'assets/gallery-5.jpg',
              'assets/hero-banner.jpg'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Image.asset(i, fit: BoxFit.cover),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
