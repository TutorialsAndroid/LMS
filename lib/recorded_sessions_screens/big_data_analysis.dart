import 'package:flutter/material.dart';

class BigDataAnalysis extends StatefulWidget {
  final String title;

  const BigDataAnalysis({super.key, required this.title});

  @override
  State<BigDataAnalysis> createState() => _BigDataAnalysisScreenState();
}

class _BigDataAnalysisScreenState extends State<BigDataAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
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
                      '1. Big Data and Analytics',
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
                    title: const Text('2. Predictive Analytics', style: TextStyle(color: Colors.white),),
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
                    title: const Text('3. Descriptive Analytics and Survival Analysis', style: TextStyle(color: Colors.white),),
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
                    title: const Text('4. Meet Hadoop',style: TextStyle(color: Colors.white),),
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