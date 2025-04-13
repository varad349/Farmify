import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        /*actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],*/
      ),
      body: ListView(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/Profile/profile.png'),
              ),
              SizedBox(height: 10),
              Text(
                'John Doe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('johndoe@mail.com'),
            ],
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('My Orders'),
            trailing: Text('12'),
            onTap: () {}, // TODO: Handle order list navigation
          ),
          ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('Shipping Addresses'),
            trailing: Text('3'),
            onTap: () {}, // TODO: Handle address list navigation
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Payment Methods'),
            trailing: Text('Visa "34'),
            onTap: () {}, // TODO: Handle payment methods navigation
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('Promocodes'),
            trailing: Text('You have special promocodes'),
            onTap: () {}, // TODO: Handle promocodes navigation
          ),
          ListTile(
            leading: Icon(Icons.reviews),
            title: Text('My Reviews'),
            trailing: Text('4'),
            onTap: () {}, // TODO: Handle reviews navigation
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {}, // TODO: Handle settings navigation
          ),
        ],
      ),
    );
  }
}
