import 'package:flutter/material.dart';

class Scheme {
  final String title;
  final String imageUrl;
  final String description;

  Scheme({
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

class SchemesPage extends StatelessWidget {
  final List<Scheme> schemes = [
    Scheme(
      title: 'Pradhan Mantri Fasal Bima Yojana',
      imageUrl: 'assets/Schemes/scheme2.jpg',
      description: 'PMFBY aims to provide insurance coverage and financial support to the farmers in the event of failure of any of the notified crop.',
    ),
    Scheme(
      title: 'PM-Kisan Yojana',
      imageUrl: 'assets/Schemes/scheme1.png',
      description: 'PM-Kisan is a Central Sector scheme with 100% funding from the Government of India.',
    ),
    Scheme(
      title: 'Pradhan Mantri Fasal Bima Yojana',
      imageUrl: 'assets/Schemes/scheme2.jpg',
      description: 'PMFBY aims to provide insurance coverage and financial support to the farmers in the event of failure of any of the notified crop.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Government Schemes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF285429),
      ),
      body: ListView.builder(
        itemCount: schemes.length,
        itemBuilder: (context, index) {
          return SchemeCard(scheme: schemes[index]);
        },
      ),
    );
  }
}

class SchemeCard extends StatelessWidget {
  final Scheme scheme;

  const SchemeCard({Key? key, required this.scheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            scheme.imageUrl,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  scheme.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  scheme.description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Government Schemes',
    home: SchemesPage(),
  ));
}
