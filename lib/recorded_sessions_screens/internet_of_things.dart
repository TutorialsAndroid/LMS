import 'package:flutter/material.dart';

class InternetOfThings extends StatefulWidget {
  final String title;

  const InternetOfThings({super.key, required this.title});

  @override
  State<InternetOfThings> createState() => _InternetOfThingsScreenState();
}

class _InternetOfThingsScreenState extends State<InternetOfThings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF004987),//#004987
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white, // Change the color here
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Add more children here using a loop
              // for (int i = 0; i < 4; i++) // Change the loop condition as needed
              Card(
                elevation: 2,
                color: const Color(0xFF3F93EC),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: Image.asset('assets/it_project_managment/lesson2.jpg'),
                    title: const Text(
                      '1. Internet of Things(IoT) Fundamentals',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Session: 01',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Add your logic here
                    },
                  ),
                ),
              ),

              Card(
                elevation: 2,
                color: const Color(0xFF005CAB),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: Image.asset('assets/it_project_managment/lesson3.jpg'),
                    title: const Text('2. IoT Building Blocks - Hardware and Software', style: TextStyle(color: Colors.white),),
                    subtitle: const Text('Session: 02', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      // Add your logic here

                    },
                  ),
                ),
              ),

              Card(
                elevation: 2,
                color: const Color(0xFF0077DB),//#0077DB
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: Image.asset('assets/it_project_managment/lesson4.jpg'),
                    title: const Text('3. Layered Architecture Models - 1', style: TextStyle(color: Colors.white),),
                    subtitle: const Text('Session: 03',style: TextStyle(color: Colors.white),),
                    onTap: () {
                      // Add your logic here

                    },
                  ),
                ),
              ),

              Card(
                elevation: 2,
                color: const Color(0xFF008BFF),//#008BFF
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: Image.asset('assets/it_project_managment/lesson5.jpg'),
                    title: const Text('4. Layered Architecture Models - 2',style: TextStyle(color: Colors.white),),
                    subtitle: const Text('Session: 04',style: TextStyle(color: Colors.white),),
                    onTap: () {
                      // Add your logic here

                    },
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}