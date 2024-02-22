import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/home_page.dart';
import 'pages/community_page.dart';
import 'pages/marketplace_page.dart';
import 'pages/schemes_page.dart';
import 'pages/learn_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CommunityPage(),
    MarketplacePage(),
    SchemesPage(),
    LearnPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_nav_home.svg',
              width: 24,
              height: 24,
              color: Colors.black,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/img_nav_home.svg',
              width: 24,
              height: 24,
              color: Colors.green,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_nav_community.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/img_nav_community.svg',
              width: 24,
              height: 24,
              color: Colors.green,
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_nav_marketplace.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/img_nav_marketplace.svg',
              width: 24,
              height: 24,
              color: Colors.green,
            ),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_nav_schemes.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/img_nav_schemes.svg',
              width: 24,
              height: 24,
              color: Colors.green,
            ),
            label: 'Schemes',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_nav_learn.svg',
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/img_nav_learn.svg',
              width: 24,
              height: 24,
              color: Colors.green,
            ),
            label: 'Learn',
          ),
        ],
        selectedItemColor: Color(0xFF285429),
      ),
    );
  }
}
