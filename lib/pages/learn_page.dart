import 'package:flutter/material.dart';

class LearnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learning Portal',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF285429),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome to Farmers Learning',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Educational Videos',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 200.0,
              color: Colors.grey,
            ),
            SizedBox(height: 20.0),
            Text(
              'Educational Resources',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            EducationalResourceCard(
              title: 'Educational Resources',
              imageUrl: 'assets/News/r1.png',
              link: 'https://thecouncil.ffa.org/resources/',
            ),
            SizedBox(height: 10.0),
            EducationalResourceCard(
              title: 'Fields of Opportunity: Resources and Support for Farmers',
              imageUrl: 'assets/News/r2.png',
              link: 'https://example.com/resource2',
            ),
            SizedBox(height: 20.0),
            Text(
              'Articles',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            ArticleCard(
              title: 'A scoping review on incentives for adoption of sustainable agricultural practices and their outcomes',
              imageUrl: 'assets/News/article2.png',
              link: 'https://example.com/article1',
            ),
            SizedBox(height: 10.0),
            ArticleCard(
              title: ' NITI Aayog has conducted a national workshop on Natural Farming',
              imageUrl: 'assets/News/article1.png',
              link: 'https://example.com/article2',
            ),
          ],
        ),
      ),
    );
  }
}

class EducationalResourceCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String link;

  const EducationalResourceCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () {
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String link;

  const ArticleCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () {
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Farmers Learning',
    home: LearnPage(),
  ));
}
