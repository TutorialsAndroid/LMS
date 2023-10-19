import 'package:flutter/material.dart';
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
      ),
      body: Center(
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
              percent: 1.0,
              center: const Text("60%", style: TextStyle(color: Colors.white, fontSize: 18),),
              progressColor: Colors.green,
            )
          ],
        ),
      )
    );
  }
}