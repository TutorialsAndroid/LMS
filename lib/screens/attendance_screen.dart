import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:percent_indicator/percent_indicator.dart';

class AttendanceScreen extends StatefulWidget {
  final String title;

  const AttendanceScreen({super.key, required this.title});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 45, 73, 40),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 45, 73, 40),
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
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Overall Attendance',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),

              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 8.0,
                percent: 0.6,
                center: const Text("60%", style: TextStyle(color: Colors.white, fontSize: 18),),
                progressColor: Colors.green,
              ),

              const Padding(
                  padding: EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Subjects', style: TextStyle(color: Colors.white, fontSize: 20),),
                  )
              ),

              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Controls the shape of the card
                elevation: 8,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Defensive Cyber Security Technologies', style: TextStyle(color: Colors.black, fontSize: 16),),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
                        child: LinearPercentIndicator(
                          percent: 0.5,
                        )
                    )
                  ],
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Controls the shape of the card
                elevation: 8,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('IT Project Management', style: TextStyle(color: Colors.black, fontSize: 16),),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
                        child: LinearPercentIndicator(
                          percent: 0.2,
                        )
                    )
                  ],
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Controls the shape of the card
                elevation: 8,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Artificial Intelligence and Machine Learning', style: TextStyle(color: Colors.black, fontSize: 16),),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
                        child: LinearPercentIndicator(
                          percent: 0.9,
                        )
                    )
                  ],
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Controls the shape of the card
                elevation: 8,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Big Data Analytics', style: TextStyle(color: Colors.black, fontSize: 16),),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
                        child: LinearPercentIndicator(
                          percent: 0.7,
                        )
                    )
                  ],
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Controls the shape of the card
                elevation: 8,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Internet of Things', style: TextStyle(color: Colors.black, fontSize: 16),),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
                        child: LinearPercentIndicator(
                          percent: 0.2,
                        )
                    )
                  ],
                ),
              ),

            ],
          ),
        )
      )
    );
  }
}