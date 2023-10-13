import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ), // This is the menu icon
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications, color: Colors.white,
                )
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.inbox, color: Colors.white,
                )
            ),
          ],
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              'Master of Computer Applications (Online Mode) JAN, 2022',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),

          Card(
            elevation: 4, // Controls the shadow and depth of the card
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Controls the shape of the card
            color: Colors.white, // Background color of the card
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.asset('assets/navratri_lms.jpg')
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}