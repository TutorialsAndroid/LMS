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
        title: Text(widget.title),
      ),
    );
  }
}