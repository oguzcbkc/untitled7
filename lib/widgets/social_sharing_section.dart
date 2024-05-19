import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSharingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Share Your Experience',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  // Share to social media
                },
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.facebook),
                onPressed: () {
                  // Share to Facebook
                },
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.twitter),
                onPressed: () {
                  // Share to Twitter
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
