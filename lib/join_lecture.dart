import 'package:flutter/material.dart';

class JoinLecture extends StatefulWidget {
  final String title;

  const JoinLecture({super.key, required this.title});

  @override
  State<JoinLecture> createState() => _JoinLectureScreenState();
}

class _JoinLectureScreenState extends State<JoinLecture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white
          ),
        ),
        centerTitle: true,
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