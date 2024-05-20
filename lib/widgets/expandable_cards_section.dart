import 'package:flutter/material.dart';

class ExpandableCardsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'More Information',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          ExpandableCard(
            title: 'Travel Tips',
            content: '''
1. **Plan Ahead**: Research your destination and plan your itinerary. Make sure to book accommodations and activities in advance.
2. **Pack Light**: Bring only essentials and versatile clothing. Roll your clothes to save space in your luggage.
3. **Stay Connected**: Ensure you have access to maps and important information by downloading them offline or using a local SIM card.
4. **Local Culture**: Respect local customs and traditions. Learn a few basic phrases in the local language.
5. **Stay Safe**: Keep your valuables secure, be aware of your surroundings, and have emergency contacts handy.
6. **Health Precautions**: Check if vaccinations are needed and carry a basic first aid kit.
7. **Money Management**: Inform your bank about your travel plans and carry multiple payment options.
8. **Sustainable Travel**: Be mindful of your environmental impact. Reduce waste, conserve water, and support local businesses.
            ''',
          ),
          ExpandableCard(
            title: 'Packing List',
            content: '''
1. **Travel Documents**: Passport, visa, travel insurance, flight tickets, and accommodation details.
2. **Clothing**:
   - Casual outfits
   - Formal attire (if needed)
   - Comfortable shoes
   - Swimwear
   - Weather-appropriate outerwear
3. **Toiletries**:
   - Toothbrush and toothpaste
   - Shampoo and conditioner
   - Deodorant
   - Sunscreen
   - Personal hygiene items
4. **Electronics**:
   - Phone and charger
   - Portable power bank
   - Camera and accessories
   - Travel adapter
5. **Health and Safety**:
   - Medications and prescriptions
   - First aid kit
   - Face masks and hand sanitizer
6. **Miscellaneous**:
   - Travel pillow and blanket
   - Snacks and water bottle
   - Travel guidebook and maps
   - Sunglasses and hat
            ''',
          ),
        ],
      ),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableCard({
    required this.title,
    required this.content,
  });

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.content),
            ),
        ],
      ),
    );
  }
}
