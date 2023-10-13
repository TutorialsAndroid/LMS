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
          ),

          Card(
            elevation: 4, // Controls the shadow and depth of the card
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Controls the shape of the card
            color: Colors.white, // Background color of the card
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.asset('assets/it_project_management.jpg',),
                  title: const Text('4.1 IT Project Management'),
                  subtitle: const Text('21VMT1S401'),
                ),

                ListTile(
                  leading: Image.asset('assets/ai_ml.jpg',),
                  title: const Text('4.2 Artificial Intelligence and Machine Learning'),
                  subtitle: const Text('21VMT1S402'),
                ),

                ListTile(
                  leading: Image.asset('assets/dcs.jpg',),
                  title: const Text('4.2 Defensive Cyber Security Technologies'),
                  subtitle: const Text('21VMT7S402'),
                ),

                ListTile(
                  leading: Image.asset('assets/bda.jpg',),
                  title: const Text('4.3 Big Data Analytics'),
                  subtitle: const Text('21VMT1S403'),
                ),

                ListTile(
                  leading: Image.asset('assets/iot.jpg',),
                  title: const Text('4.4 Internet of Things'),
                  subtitle: const Text('21VMT1S404'),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}