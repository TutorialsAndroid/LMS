import 'package:flutter/material.dart';

class RecordedSessions extends StatefulWidget {
  final String title;

  const RecordedSessions({super.key, required this.title});

  @override
  State<RecordedSessions> createState() => _RecordedSessionsScreenState();
}

class _RecordedSessionsScreenState extends State<RecordedSessions> {
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
    );
  }
}